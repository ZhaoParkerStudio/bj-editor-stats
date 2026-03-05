#!/usr/bin/env bash
set -euo pipefail

# PythonAnywhere deployment helper (Linux env)
# Usage:
#   On PythonAnywhere Console: export REPO_URL=git@github.com:yourorg/bj-editor-stats.git
#                                export BRANCH=main
#                                ./deploy/pyanywhere_deploy.sh
# This will clone or update the repo under /home/<youruser>/bj-editor-stats,
# create a virtualenv if missing, and install requirements.

REPO_URL="${REPO_URL:-}"
BRANCH="${BRANCH:-main}"
PROJECT_DIR="${PROJECT_DIR:-$HOME/bj-editor-stats}"

if [ -z "$REPO_URL" ]; then
  echo "[deploy] REPO_URL is not set. Exiting."
  exit 1
fi

echo "[deploy] Cloning/updating repository..."
mkdir -p "$HOME"
cd "$HOME"
if [ -d "bj-editor-stats/.git" ]; then
  cd bj-editor-stats
  git fetch --all
  git reset --hard "origin/$BRANCH"
else
  git clone "$REPO_URL" bj-editor-stats
  cd bj-editor-stats
  git checkout "$BRANCH" || true
fi

echo "[deploy] Setting up virtual environment..."
cd "$PROJECT_DIR"
if [ ! -d "venv" ]; then
  python3 -m venv venv
fi
. venv/bin/activate
pip install -r requirements.txt

echo "[deploy] Ready. Please reload your PythonAnywhere web app to apply changes."
