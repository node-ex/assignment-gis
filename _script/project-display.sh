#!/usr/bin/env bash
set -Eeu

echo ''
echo "[$(git symbolic-ref --short HEAD)] $(basename ${PWD})"

git submodule --quiet foreach 'echo "    [$(git symbolic-ref --short HEAD)] $(basename ${PWD})"'
echo ''
