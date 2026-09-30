#!/usr/bin/env bash
# Play the PV locally with your own audio + .lrc, auto-loaded.
# The media files are only symlinked into a temp dir outside this repo,
# so they are never committed or deployed.
#
#   tools/play-local.sh <song.mp3> [lyrics.lrc] [port]
set -euo pipefail

song="${1:?usage: tools/play-local.sh <song.mp3> [lyrics.lrc] [port]}"
lrc="${2:-}"
port="${3:-18731}"
root="$(cd "$(dirname "$0")/.." && pwd)"
serve="${TMPDIR:-/tmp}/claude-execute-me-local"

rm -rf "$serve"
mkdir -p "$serve"
ln -s "$root/public/index.html" "$serve/index.html"
ln -s "$(cd "$(dirname "$song")" && pwd)/$(basename "$song")" "$serve/song.mp3"
[ -n "$lrc" ] && ln -s "$(cd "$(dirname "$lrc")" && pwd)/$(basename "$lrc")" "$serve/lrc.lrc"

url="http://127.0.0.1:$port/"
echo "▶ $url  (Ctrl+C to stop)"
[ -z "${NO_OPEN:-}" ] && (sleep 1 && open "$url" 2>/dev/null || true) &
exec python3 -m http.server "$port" --bind 127.0.0.1 --directory "$serve"
