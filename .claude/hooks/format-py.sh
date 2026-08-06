#!/bin/sh
# PostToolUse hook: format the edited file with ruff if it's a .py file.
f=$(jq -r '.tool_input.file_path // empty')
case "$f" in
  *.py) uv run ruff format "$f" ;;
esac
