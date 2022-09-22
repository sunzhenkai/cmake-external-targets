#!/bin/bash
BASE=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

DEP=$(basename "$BASE")
COMMIT_ID=boost-1.80.0
REPO="https://github.com/boostorg/boost.git"
bash "$BASE/../scripts/pack_git_repo.sh" -r ${REPO} -v "$DEP"-submodule-${COMMIT_ID} \
  -c ${COMMIT_ID} -w "${BASE}"/tmp
