#!/usr/bin/env bash
set -euo pipefail

destination=""
url=""

while [[ $# -gt 0 ]]; do
  case "$1" in
    -O)
      destination="$2"
      shift 2
      ;;
    *)
      url="$1"
      shift
      ;;
  esac
done

if [[ -n "${MOCK_WGET_LOG:-}" ]]; then
  printf '%s\n' "$url" > "$MOCK_WGET_LOG"
fi

if [[ -n "$destination" ]]; then
  printf '# Mock checklist\n' > "$destination"
fi
