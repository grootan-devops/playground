#!/usr/bin/env bash
set -euo pipefail
echo "backend service, version $(cat /VERSION 2>/dev/null || echo unknown)"
