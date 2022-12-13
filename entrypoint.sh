#!/bin/sh

set -euo pipefail

[[ -z "${1-}" ]] && \
  echo "::error::You must pass a personal access token with release permissions." && \
  exit 1

[[ -z "${2-}" ]] && \
  echo "::error::You must pass the repository." && \
  exit 1

[[ -z "${3-}" ]] && \
  echo "::error::You must pass the source branch." && \
  exit 1

[[ -z "${4-}" ]] && \
  echo "::error::You must pass the title." && \
  exit 1

TOKEN="${1}"
REPO="${2}"
BRANCH="${3}"
TITLE="${4}"
LATEST="${5:-true}"

curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${TOKEN}" \
  "https://api.github.com/repos/${REPO}/releases" \
  -d "{\"tag_name\":\"${TITLE}\",\"target_commitish\":\"${BRANCH}\",\"name\":\"${TITLE}\",\"make_latest\":\"${LATEST}\"}"
