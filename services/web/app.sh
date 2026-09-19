#!/usr/bin/env bash
set -euo pipefail
echo "web service, version $(cat /VERSION 2>/dev/null || echo unknown)"
