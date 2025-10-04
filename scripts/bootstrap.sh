#!/usr/bin/env bash
set -euo pipefail

REPO_ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")"/.. && pwd)"
cd "$REPO_ROOT"

REQUIRED_VERSION="3.10"
PYTHON_BIN=${PYTHON_BIN:-}

is_compatible() {
  "$1" -c 'import sys; exit(0 if sys.version_info[:2] >= (3, 10) else 1)'
}

if [ -n "${PYTHON_BIN}" ]; then
  if ! command -v "$PYTHON_BIN" >/dev/null 2>&1; then
    echo "[error] $PYTHON_BIN not found. Install Python >= $REQUIRED_VERSION or adjust PYTHON_BIN." >&2
    exit 1
  fi
  if ! is_compatible "$PYTHON_BIN"; then
    echo "[error] $PYTHON_BIN is older than Python $REQUIRED_VERSION." >&2
    exit 1
  fi
else
  for candidate in python3.10 python3 python; do
    if command -v "$candidate" >/dev/null 2>&1 && is_compatible "$candidate"; then
      PYTHON_BIN="$candidate"
      break
    fi
  done
fi

if [ -z "${PYTHON_BIN:-}" ]; then
  cat >&2 <<'MSG'
[error] Could not find a Python interpreter >=3.10.
Install Python 3.10+ (e.g. via pyenv or Homebrew) and rerun, or set PYTHON_BIN to a compatible binary.
MSG
  exit 1
fi

if [ ! -d .venv ]; then
  "$PYTHON_BIN" -m venv .venv
fi

# shellcheck disable=SC1091
source .venv/bin/activate

python -m pip install --upgrade pip setuptools wheel

pip install -r requirements.txt

if [[ -f requirements.dev.txt ]]; then
  pip install -r requirements.dev.txt
fi

cat <<'MSG'
Environment ready.
Activate with: source .venv/bin/activate
MSG
