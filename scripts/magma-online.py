#!/usr/bin/env python3
"""Run one bounded job through the public Magma calculator, preserving evidence.

Protocol reference: Sage's src/sage/interfaces/magma_free.py. This independent
stdlib client uses HTTPS and the calculator's current 60-second/50000-byte
limits. It never retries, splits jobs, or supplies a success marker itself.
"""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
import os
from pathlib import Path
import platform
import re
import socket
import sys
import time
import urllib.error
import urllib.parse
import urllib.request
import xml.etree.ElementTree as ET


ENDPOINT = "https://magma.maths.usyd.edu.au/xml/calculator.xml"
CALCULATOR_PAGE = "https://magma.maths.usyd.edu.au/calc/"
INPUT_LIMIT = 50000
SERVICE_SECONDS = 60
ROOT = Path(__file__).resolve().parents[1]
RUN_ROOT = ROOT / "build" / "online-magma"
TIMEOUT_PATTERN = re.compile(
    r"\btimeout\b|\btimed\s+out\b|\btime\s+limit\s+(?:exceeded|reached)\b|"
    r"\bmaximum\s+(?:cpu\s+)?time\b", re.IGNORECASE
)
ERROR_PATTERN = re.compile(
    r"\b(?:runtime|user|syntax|internal|fatal)\s+error\b|"
    r"\bassertion\s+(?:failed|failure)\b|\bnot\s+declared\s+or\s+assigned\b|"
    r"^\s*error\s*:", re.IGNORECASE | re.MULTILINE
)


def utc_now() -> str:
    return dt.datetime.now(dt.timezone.utc).isoformat(timespec="milliseconds")


def sha256(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def local_tag(element: ET.Element) -> str:
    return element.tag.rsplit("}", 1)[-1].lower()


def parse_response(raw: bytes, expected_marker: str) -> dict:
    """Parse results and prioritize server/Magma errors over any pass marker."""
    decoded = raw.decode("utf-8", errors="replace")
    try:
        tree = ET.fromstring(raw)
    except ET.ParseError as exc:
        status = "service_timeout" if TIMEOUT_PATTERN.search(decoded) else "xml_error"
        return {"status": status, "output": decoded, "detail": str(exc)}

    errors = ["".join(node.itertext()).strip() for node in tree.iter()
              if local_tag(node) in {"error", "errors", "exception", "timeout"}]
    errors = [error for error in errors if error]
    result_nodes = [node for node in tree.iter() if local_tag(node) == "results"]
    lines = ["".join(node.itertext()) for result in result_nodes
             for node in result.iter() if local_tag(node) == "line"]
    output = "\n".join(lines)
    if not lines and result_nodes:
        output = "\n".join("".join(node.itertext()).strip() for node in result_nodes)
    all_text = "\n".join(tree.itertext())
    error_matches = ERROR_PATTERN.findall(all_text)
    marker_seen = expected_marker in {line.strip() for line in output.splitlines()}
    if TIMEOUT_PATTERN.search(all_text):
        status = "service_timeout"
    elif errors or error_matches:
        status = "magma_error"
    elif not result_nodes:
        status = "xml_error"
    elif not marker_seen:
        status = "missing_pass_marker"
    else:
        status = "pass"
    version = re.search(r"^ONLINE_MAGMA_VERSION\|(.+)$", output, re.MULTILINE)
    cpu = re.search(r"^ONLINE_MAGMA_CPU_SECONDS\|(.+)$", output, re.MULTILINE)
    header_nodes = [node for node in tree.iter() if local_tag(node) == "headers"]
    headers = {local_tag(node): "".join(node.itertext()).strip()
               for header in header_nodes for node in header}
    return {"status": status, "output": output, "xml_error_messages": errors,
            "magma_error_matches": error_matches, "pass_marker_seen": marker_seen,
            "server_headers": headers,
            "magma_version": headers.get("version") or (version.group(1).strip() if version else None),
            "magma_version_printed": version.group(1).strip() if version else None,
            "magma_cpu_seconds_text": cpu.group(1).strip() if cpu else None}


def transmit_input(source: str) -> bytes:
    prefix = ('SetColumns(500);\nSetSeed(1);\n'
              'OnlineMagmaMajor, OnlineMagmaMinor, OnlineMagmaPatch := GetVersion();\n'
              'printf "ONLINE_MAGMA_VERSION|%o.%o-%o\\n", '
              'OnlineMagmaMajor, OnlineMagmaMinor, OnlineMagmaPatch;\n'
              'OnlineMagmaClientClock := Cputime();\n')
    suffix = ('\nprintf "ONLINE_MAGMA_CPU_SECONDS|%o\\n", '
              'Cputime(OnlineMagmaClientClock);\n')
    return (prefix + source + suffix).encode("utf-8")


def run(args: argparse.Namespace) -> tuple[int, dict]:
    original = args.input.resolve()
    source_bytes = original.read_bytes()
    source = source_bytes.decode("utf-8-sig")
    transmitted = transmit_input(source)
    stamp = dt.datetime.now(dt.timezone.utc).strftime("%Y%m%dT%H%M%S%fZ")
    run_dir = RUN_ROOT / f"{stamp}-{args.name}"
    run_dir.mkdir(parents=True, exist_ok=False)
    (run_dir / "source.m").write_bytes(source_bytes)
    (run_dir / "input.m").write_bytes(transmitted)
    form_data = urllib.parse.urlencode({"input": transmitted.decode("utf-8")}).encode("ascii")
    record = {
        "schema_version": 1, "job_name": args.name, "endpoint": ENDPOINT,
        "calculator_page": CALCULATOR_PAGE, "service_cpu_limit_seconds": SERVICE_SECONDS,
        "service_input_limit_bytes": INPUT_LIMIT, "transport_timeout_seconds": args.timeout,
        "automatic_retries": 0, "seed": 1, "columns": 500,
        "input_original_path": str(original), "source_sha256": sha256(source_bytes),
        "transmitted_sha256": sha256(transmitted), "transmitted_input_bytes": len(transmitted),
        "form_body_bytes": len(form_data), "expected_pass_marker": args.expect_pass,
        "client_path": str(Path(__file__).resolve()),
        "client_sha256": sha256(Path(__file__).read_bytes()),
        "python_version": platform.python_version(), "started_utc": utc_now(),
        "request_sent": False, "http_status": None, "status": "not_run",
        "run_directory": str(run_dir), "magma_version": None,
    }
    (run_dir / "record.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
    started = time.monotonic()
    raw = b""
    output = ""
    lock_path = RUN_ROOT / ".request.lock"
    lock_fd = None
    try:
        if len(transmitted) > INPUT_LIMIT:
            record.update(status="input_rejected", detail="Transmitted input exceeds 50000 bytes; no request sent.")
        else:
            # One active request across all invocations of this project client.
            # A stale lock after a forced kill requires manual inspection/removal.
            try:
                lock_fd = os.open(lock_path, os.O_CREAT | os.O_EXCL | os.O_WRONLY)
            except FileExistsError:
                record.update(status="client_busy", detail=f"Inspect active/stale lock: {lock_path}")
            if lock_fd is not None:
                os.write(lock_fd, json.dumps({"pid": os.getpid(), "run_directory": str(run_dir),
                                             "started_utc": record["started_utc"]}).encode("utf-8"))
                request = urllib.request.Request(ENDPOINT, data=form_data, method="POST", headers={
                    "Content-Type": "application/x-www-form-urlencoded",
                    "Accept": "application/xml, text/xml",
                    "Referer": CALCULATOR_PAGE,
                    "User-Agent": "EnnolaMagmaClient/1.0 (Python stdlib; sequential bounded jobs)",
                })
                record["request_sent"] = True
                with urllib.request.urlopen(request, timeout=args.timeout) as response:
                    record["http_status"] = response.status
                    record["response_headers"] = dict(response.headers.items())
                    raw = response.read()
                result = parse_response(raw, args.expect_pass)
                output = result.pop("output")
                record.update(result)
    except urllib.error.HTTPError as exc:
        raw = exc.read()
        output = raw.decode("utf-8", errors="replace")
        record.update(status="http_error", http_status=exc.code, detail=str(exc))
    except (TimeoutError, socket.timeout) as exc:
        record.update(status="transport_timeout", detail=str(exc))
    except urllib.error.URLError as exc:
        timed_out = isinstance(exc.reason, (TimeoutError, socket.timeout))
        record.update(status="transport_timeout" if timed_out else "network_error", detail=str(exc))
    except (OSError, ValueError) as exc:
        record.update(status="client_error", detail=f"{type(exc).__name__}: {exc}")
    finally:
        if lock_fd is not None:
            os.close(lock_fd)
            lock_path.unlink()
        record["finished_utc"] = utc_now()
        record["wall_seconds"] = round(time.monotonic() - started, 6)
        record["response_bytes"] = len(raw)
        record["response_sha256"] = sha256(raw) if raw else None
        (run_dir / "response.xml").write_bytes(raw)
        (run_dir / "output.txt").write_text(output + ("\n" if output else ""), encoding="utf-8")
        (run_dir / "record.json").write_text(json.dumps(record, indent=2) + "\n", encoding="utf-8")
    summary = {key: record.get(key) for key in ("status", "job_name", "http_status", "magma_version",
                                               "wall_seconds", "transmitted_input_bytes", "run_directory")}
    if "detail" in record:
        summary["detail"] = record["detail"]
    return (0 if record["status"] == "pass" else 1), summary


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("input", type=Path, help="UTF-8 Magma source containing its own guarded pass marker")
    parser.add_argument("--name", required=True, help="Short job name used in the build output directory")
    parser.add_argument("--expect-pass", required=True, help="Exact output line printed only after the job's assertions")
    parser.add_argument("--timeout", type=float, default=60, help="Transport timeout in seconds (0 < timeout <= 60)")
    args = parser.parse_args()
    if not re.fullmatch(r"[a-zA-Z0-9][a-zA-Z0-9_-]{0,63}", args.name):
        parser.error("--name must contain 1-64 ASCII letters, digits, underscores, or hyphens")
    if not re.fullmatch(r"[A-Z][A-Z0-9_]{0,127}", args.expect_pass):
        parser.error("--expect-pass must be an uppercase ASCII identifier")
    if not 0 < args.timeout <= SERVICE_SECONDS:
        parser.error("--timeout must be greater than zero and no more than 60 seconds")
    try:
        exit_code, summary = run(args)
    except (OSError, UnicodeError) as exc:
        print(json.dumps({"status": "input_error", "detail": str(exc)}))
        return 2
    print(json.dumps(summary, indent=2))
    return exit_code


if __name__ == "__main__":
    sys.exit(main())
