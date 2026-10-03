#!/usr/bin/env python3
"""Run one selected new Magma specialization verifier and preserve evidence."""

from __future__ import annotations

import argparse
import datetime as dt
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys
import time


ROOT = Path(__file__).resolve().parents[1]
RUN_ROOT = ROOT / "build" / "specializations"
MAGMA = Path("C:/Program Files (x86)/Magma/magma.exe")
PARAMETERS = {
    "rational": {"0", "2", "7/2", "4"},
    "integer": {"-54", "-46", "-42", "-40", "-39", "-38", "17", "23", "42", "45", "55"},
}
MARKERS = {
    "full": "ENNOLA_SPECIALIZATION_PASS",
    "rank": "ENNOLA_SPECIALIZATION_RANK_PASS",
    "discover": "ENNOLA_SPECIALIZATION_CERTIFICATE_PASS",
    "certificate": "ENNOLA_SPECIALIZATION_CERTIFICATE_PASS",
}
ERROR = re.compile(
    r"\b(?:runtime|user|syntax|internal|fatal)\s+error\b|"
    r"\bassertion\s+(?:failed|failure)\b|\bnot\s+declared\s+or\s+assigned\b|"
    r"^\s*error\s*:", re.IGNORECASE | re.MULTILINE
)


def now() -> str:
    return dt.datetime.now(dt.timezone.utc).isoformat(timespec="milliseconds")


def digest(data: bytes) -> str:
    return hashlib.sha256(data).hexdigest()


def save_json(path: Path, value: dict) -> None:
    path.write_text(json.dumps(value, indent=2) + "\n", encoding="utf-8")


def report(value: dict) -> None:
    print(json.dumps(value), flush=True)


def inspect_output(output: str, marker: str) -> dict:
    version = re.search(r"^MAGMA_VERSION=(.+)$", output, re.MULTILINE)
    rank = re.search(r"^RANK_BOUNDS=\[(\d+),(\d+)\]$", output, re.MULTILINE)
    count = re.search(r"^CERTIFIED_POINT_COUNT=(\d+) PRODUCT_COUNT=(\d+)$", output, re.MULTILINE)
    settings = re.search(r"^RANK_SETTINGS=(.+)$", output, re.MULTILINE)
    coordinates = re.search(r"FRESH_COORDINATES_BEGIN\s*(.*?)\s*FRESH_COORDINATES_END", output, re.DOTALL)
    return {
        "magma_version": version.group(1) if version else None,
        "rank_bounds": [int(rank.group(1)), int(rank.group(2))] if rank else None,
        "rank_settings": settings.group(1) if settings else None,
        "certified_point_count": int(count.group(1)) if count else None,
        "tested_product_count": int(count.group(2)) if count else None,
        "pass_marker_seen": marker in {line.strip() for line in output.splitlines()},
        "error_matches": ERROR.findall(output),
        "fresh_coordinates_assignment": coordinates.group(1).strip() if coordinates else None,
    }


def run_local(source: bytes, run_dir: Path, marker: str, timeout: float, reason: str) -> dict:
    local_dir = run_dir / "local"
    local_dir.mkdir()
    full = (b"SetColumns(500);\nLocalJobClock := Cputime();\n" + source +
            b'\nprintf "LOCAL_TOTAL_CPU_SECONDS=%o\\n", Cputime(LocalJobClock);\nquit;\n')
    input_path = local_dir / "input.m"
    input_path.write_bytes(full)
    command = [str(MAGMA), "-n", "-S", "1", "-b", str(input_path)]
    record = {
        "schema_version": 1, "route": "local", "reason": reason,
        "command": command, "started_utc": now(), "timeout_seconds": timeout,
        "source_sha256": digest(source), "executed_sha256": digest(full),
        "expected_pass_marker": marker, "status": "running",
    }
    save_json(local_dir / "record.json", record)
    report({"event": "local_started", "directory": str(local_dir), "command": command})
    started = time.monotonic()
    try:
        with (local_dir / "output.log").open("wb") as log:
            process = subprocess.run(command, cwd=ROOT, stdout=log, stderr=subprocess.STDOUT,
                                     stdin=subprocess.DEVNULL, timeout=timeout, check=False)
        record["exit_code"] = process.returncode
        raw = (local_dir / "output.log").read_bytes()
        output = raw.decode("utf-8", errors="replace")
        record.update(inspect_output(output, marker))
        record["status"] = "pass" if (process.returncode == 0 and record["pass_marker_seen"]
                                         and not record["error_matches"]) else "magma_error"
    except subprocess.TimeoutExpired:
        record.update(status="local_timeout", exit_code=None)
    except OSError as exc:
        record.update(status="local_process_error", detail=f"{type(exc).__name__}: {exc}")
    raw = (local_dir / "output.log").read_bytes() if (local_dir / "output.log").exists() else b""
    record.update(finished_utc=now(), wall_seconds=round(time.monotonic()-started, 6),
                  output_sha256=digest(raw), output_bytes=len(raw))
    if record.get("fresh_coordinates_assignment"):
        (local_dir / "coordinates.m").write_text(record["fresh_coordinates_assignment"] + "\n", encoding="utf-8")
    save_json(local_dir / "record.json", record)
    report({"event": "local_finished", **{k: record.get(k) for k in
            ("status", "magma_version", "rank_bounds", "certified_point_count", "wall_seconds", "detail")}})
    return record


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("family", choices=PARAMETERS)
    parser.add_argument("parameter")
    parser.add_argument("--mode", choices=MARKERS, default="full")
    parser.add_argument("--coordinates", type=Path)
    parser.add_argument("--local-timeout", type=float, default=600)
    parser.add_argument("--timed-out-record", type=Path,
                        help="Rerun locally only after the supplied remote timeout record")
    args = parser.parse_args()
    if args.parameter not in PARAMETERS[args.family]:
        parser.error("Parameter is not a selected manuscript specialization")
    stamp = dt.datetime.now(dt.timezone.utc).strftime("%Y%m%dT%H%M%S%fZ")
    slug = args.parameter.replace("-", "minus").replace("/", "over")
    name = f"specialization-{args.family}-{slug}-{args.mode}"
    run_dir = RUN_ROOT / f"{stamp}-{name}"
    run_dir.mkdir(parents=True)
    verifier = ROOT / "Computations" / "verify-specialization.m"
    prefix = (f'SpecializationFamily := "{args.family}";\n'
              f'SpecializationParameter := Rationals()!({args.parameter});\n'
              f'SpecializationMode := "{args.mode}";\n')
    if args.coordinates:
        prefix += args.coordinates.read_text(encoding="utf-8-sig") + "\n"
    source = (prefix + verifier.read_text(encoding="utf-8-sig")).encode("utf-8")
    source_path = run_dir / "source.m"
    source_path.write_bytes(source)
    marker = MARKERS[args.mode]
    summary = {
        "schema_version": 1, "family": args.family, "parameter": args.parameter,
        "mode": args.mode, "source_sha256": digest(source),
        "verifier_sha256": digest(verifier.read_bytes()), "run_directory": str(run_dir),
        "started_utc": now(), "expected_pass_marker": marker,
    }
    if args.timed_out_record:
        previous = json.loads(args.timed_out_record.read_text(encoding="utf-8"))
        if previous.get("status") not in {"transport_timeout", "service_timeout"}:
            parser.error("Local rerun authorization requires a remote timeout record")
        if previous.get("source_sha256") != digest(source):
            parser.error("Local rerun source must match the previous timed-out source")
        summary["remote_record"] = str(args.timed_out_record.resolve())
        result = run_local(source, run_dir, marker, args.local_timeout, str(args.timed_out_record.resolve()))
        summary["local_record"] = str(run_dir / "local" / "record.json")
    else:
        command = [sys.executable, "-X", "utf8", str(ROOT / "scripts" / "magma-online.py"),
                   str(source_path), "--name", name, "--expect-pass", marker]
        report({"event": "remote_started", "name": name, "directory": str(run_dir)})
        process = subprocess.run(command, cwd=ROOT, capture_output=True, check=False)
        (run_dir / "client.stdout").write_bytes(process.stdout)
        (run_dir / "client.stderr").write_bytes(process.stderr)
        try:
            remote_summary = json.loads(process.stdout.decode("utf-8-sig"))
            remote_dir = Path(remote_summary["run_directory"])
            remote_record = remote_dir / "record.json"
            result = json.loads(remote_record.read_text(encoding="utf-8"))
            summary["remote_record"] = str(remote_record)
            output = (remote_dir / "output.txt").read_text(encoding="utf-8")
            extracted = inspect_output(output, marker)
            summary["remote_details"] = extracted
            if extracted["fresh_coordinates_assignment"]:
                (run_dir / "coordinates.m").write_text(extracted["fresh_coordinates_assignment"] + "\n", encoding="utf-8")
            report({"event": "remote_finished", **remote_summary, **{k: extracted[k] for k in
                    ("rank_bounds", "certified_point_count")}})
            if result["status"] in {"transport_timeout", "service_timeout"}:
                result = run_local(source, run_dir, marker, args.local_timeout, str(remote_record))
                summary["local_record"] = str(run_dir / "local" / "record.json")
        except (ValueError, KeyError, OSError) as exc:
            result = {"status": "orchestration_error", "detail": f"{type(exc).__name__}: {exc}"}
            report(result)
    summary.update(status=result["status"], finished_utc=now())
    save_json(run_dir / "summary.json", summary)
    with (RUN_ROOT / "runs.jsonl").open("a", encoding="utf-8") as ledger:
        ledger.write(json.dumps(summary) + "\n")
    report({"event": "job_finished", "status": summary["status"], "summary": str(run_dir / "summary.json")})
    return 0 if summary["status"] == "pass" else 1


if __name__ == "__main__":
    raise SystemExit(main())
