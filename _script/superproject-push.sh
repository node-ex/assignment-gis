#!/usr/bin/env bash
set -Eeu

./_script/superproject-commit.sh

git pull
git push
