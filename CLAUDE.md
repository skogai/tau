# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

@AGENTS.md

## Commands

- Setup: `uv sync --dev`
- Run tests: `uv run pytest`
- Lint: `uv run ruff check .`
- Format check: `uv run ruff format --check .`
- Type check: `uv run mypy`
- Run the CLI locally: `uv run tau` (or `uv run tau -p "..."` for a single prompt)

CI (`.github/workflows/ci.yml`) runs pytest, ruff check, ruff format --check, and mypy in that order — match this before considering work done.

## Project layout

Single `uv`-managed Python package (`tau-ai`, Python >=3.12) split into three layers under `src/`:

- `tau_ai/` — provider/model streaming layer
- `tau_agent/` — portable agent harness (loop, tools, events, sessions); must stay free of Textual/Rich/CLI dependencies
- `tau_coding/` — CLI app, TUI, resources, skills, extensions (entry point `tau = "tau_coding.cli:app"`)

Sessions are stored as JSONL under `~/.tau/sessions/`. Custom provider catalogs live in `~/.tau/catalog.toml` (schema in `src/tau_coding/data/catalog.toml`).

## Git remotes

This is a fork: `origin` is `skogai/tau`, `upstream` is `huggingface/tau`. Don't assume `origin/main` is the canonical upstream branch when comparing history.
