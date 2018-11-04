#!/usr/bin/env bash
set -Eeu

BRANCH=master

git branch "${BRANCH}" 2>/dev/null || true
git checkout "${BRANCH}"
git submodule foreach "git branch ${BRANCH} 2>/dev/null || true ; git checkout ${BRANCH}"
