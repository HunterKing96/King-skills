#!/usr/bin/env bash
set -euo pipefail
repo_root="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")/.." && pwd)"
cd "$repo_root"
python3 -m venv .venv
.venv/bin/python -m pip install -r skills-python.lock.txt -r .agents/skills/ppt-master/requirements.txt -r .agents/skills/drawio-reconstruction/requirements.txt
.venv/bin/python -m pip check
.venv/bin/python .agents/skills/ppt-master/scripts/attribution_guard.py
