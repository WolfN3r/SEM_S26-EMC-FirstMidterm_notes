#!/usr/bin/env python3
"""Extract a short summary from the Claude Code session transcript."""
import sys
import json

MAX = 200
inp = json.load(sys.stdin)
last = inp.get("last_assistant_message", "") or ""
tp = inp.get("transcript_path", "")

task = ""
if tp:
    try:
        with open(tp, "r", encoding="utf-8") as f:
            for line in f:
                entry = json.loads(line)
                if entry.get("role") == "user":
                    c = entry.get("content", "")
                    if isinstance(c, list):
                        c = " ".join(
                            b.get("text", "")
                            for b in c
                            if isinstance(b, dict) and b.get("type") == "text"
                        )
                    task = c.strip().replace("\n", " ")
                    break
    except Exception:
        pass

parts = []
if task:
    parts.append("Task: " + task)
if last:
    snippet = " ".join(last.strip().split())
    parts.append("Done: " + snippet)

msg = " | ".join(parts) if parts else "Session completed."
if len(msg) > MAX:
    msg = msg[: MAX - 3] + "..."
print(msg)
