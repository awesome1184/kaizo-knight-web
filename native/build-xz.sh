#!/usr/bin/env bash
set -euo pipefail

DIR="./native/xz"
ARCHIVE="$DIR/xz-5.4.6.tar.gz"
mkdir -p "$DIR"
curl -fL --retry 3 "https://github.com/tukaani-project/xz/releases/download/v5.4.6/xz-5.4.6.tar.gz" -o "$ARCHIVE"
tar -xzf "$ARCHIVE" -C "$DIR"
cd "$DIR/xz-5.4.6"
emconfigure ./configure --disable-shared --disable-doc --disable-nls
emmake make -j2
