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
PRERELEASE="${5:-false}"
LATEST="${6:-true}"

curl \
  -X POST \
  -H "Accept: application/vnd.github+json" \
  -H "Authorization: Bearer ${TOKEN}" \
  -H "X-GitHub-Api-Version: 2022-11-28" \
  "https://api.github.com/repos/${REPO}/releases" \
  -d "{\"tag_name\":\"${TITLE}\",\"target_commitish\":\"${BRANCH}\",\"name\":\"${TITLE}\",\"prerelease\":${PRERELEASE},\"make_latest\":\"${LATEST}\"}"
