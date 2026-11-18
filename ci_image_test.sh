#!/usr/bin/env bash
# Smoke test docker.yml runs inside the candidate image, from the repository root.
# The binary must report this release's version (the candidate tag starts with it)
# and the image must run as the non-root user.
set -euo pipefail

EXPECTED="$(tr -d '[:space:]' < VERSION)"
OUT="$(/app/playground -version)"
echo "${OUT}"

if [[ "${OUT}" != "playground ${EXPECTED}"* ]]; then
  echo "Expected version ${EXPECTED} or a candidate of it, got: ${OUT}" >&2
  exit 1
fi
if [[ "$(id -u)" != "10001" ]]; then
  echo "The image must run as uid 10001, got $(id -u)." >&2
  exit 1
fi
echo "Smoke test passed."
