#!/bin/bash
BASE=$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" &>/dev/null && pwd)

DEP=$(basename "$BASE")
AUTHOR=google
PROJECT=leveldb
COMMIT_ID=1.23
REPO="https://github.com/${AUTHOR}/${PROJECT}.git"
DEST="$DEP"-submodule-${COMMIT_ID}
bash "$BASE/../scripts/pack_git_repo.sh" -r ${REPO} -v "$DEST" \
  -c ${COMMIT_ID} -w "${BASE}"/tmp

oss cp "${BASE}/tmp/${DEST}.tar.gz" oss://wii-share/cpp/external/
echo "speed up url: https://wii-share.oss-cn-beijing.aliyuncs.com/cpp/external/${DEST}.tar.gz"
