---
name: verify
description: Run the same checks CI runs (pytest, ruff check, ruff format --check, mypy) to confirm the working tree is green before calling work done.
---

Run these in order, matching `.github/workflows/ci.yml`, and stop at the first failure to fix it before continuing:

1. `uv run pytest`
2. `uv run ruff check .`
3. `uv run ruff format --check .`
4. `uv run mypy`

Report which steps passed/failed. If `ruff format --check` fails, offer to run `uv run ruff format .` to fix it in place rather than hand-editing formatting.
