#!/bin/sh
# PostToolUse hook: format the edited file with ruff if it's a .py file.
# Quiet on success; failures (missing tools, ruff errors) go to a log
# instead of vanishing, so a broken setup is still discoverable.
dir=$(dirname "$0")
log="$dir/format-py.log"
f=$(jq -r '.tool_input.file_path // empty')
case "$f" in
  *.py)
    if ! command -v uv >/dev/null 2>&1; then
      echo "$(date -Iseconds) uv not found on PATH" >> "$log"
      exit 0
    fi
    if ! uv run ruff format -q "$f" 2>>"$log"; then
      echo "$(date -Iseconds) ruff format failed for $f" >> "$log"
    fi
    ;;
esac
