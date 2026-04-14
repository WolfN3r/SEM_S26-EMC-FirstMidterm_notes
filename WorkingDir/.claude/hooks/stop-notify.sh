#!/usr/bin/env bash
# Claude Code Stop hook - sends ntfy.sh notification when a session ends.
# NTFY_TOPIC is passed as an environment variable via docker run --env NTFY_TOPIC.

HOOK_DIR="$(cd "$(dirname "$0")" && pwd)"
LOG_FILE="$HOOK_DIR/hook-errors.log"

# Read hook input from stdin
INPUT=$(cat)

# Prevent infinite loop: if hook already fired once, just exit
IS_ACTIVE=$(echo "$INPUT" | python3 -c "import sys,json; print(json.load(sys.stdin).get('stop_hook_active',False))" 2>/dev/null || echo "False")
[ "$IS_ACTIVE" = "True" ] && exit 0

# Read topic from environment
TOPIC="${NTFY_TOPIC}"
[ -z "$TOPIC" ] && exit 0

# Build a descriptive summary (<=200 chars) from the session transcript
MSG=$(echo "$INPUT" | python3 "$HOOK_DIR/build-summary.py" 2>>"$LOG_FILE" || echo "Claude Code: Session completed.")

curl -s -d "$MSG" "https://ntfy.sh/$TOPIC" >/dev/null 2>&1

exit 0
