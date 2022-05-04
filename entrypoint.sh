#!/bin/sh

set -euo pipefail

[[ -z "${1-}" ]] && \
  echo "::error::You must pass a repository." && \
  exit 1

[[ -z "${2-}" ]] && \
  echo "::error::You must pass a release name." && \
  exit 1

[[ -z "${3-}" ]] && \
  echo "::error::You must pass a tag name." && \
  exit 1

[[ -z "${4-}" ]] && \
  echo "::error::You must pass a personal access token with release permissions." && \
  exit 1

REPO="${1}"
RELEASE_NAME="${2}"
TAG_NAME="${3}"
TOKEN="${4}"

curl \
  -X POST \
  -H "Accept: application/vnd.github.v3+json" \
  -H "Authorization: token ${TOKEN}" \
  "https://api.github.com/repos/${REPO}/releases" \
  -d "{\"tag_name\":\"${TAG_NAME}\",\"target_commitish\":\"main\",\"name\":\"${RELEASE_NAME}\"}"
