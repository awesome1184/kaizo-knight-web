#!/usr/bin/env bash
set -euo pipefail

BASE="./native"
OBJS="$BASE/out"
XZ_BASE="$BASE/xz/xz-5.4.6"
mkdir -p "$OBJS" ./dist

FLAGS="-O2"
CFLAGS="$FLAGS -I $BASE/xdelta/xdelta3 -I $XZ_BASE/src/liblzma/api -D XD3_USE_LARGEFILE64=1 \
  -D SIZEOF_SIZE_T=4 -D SIZEOF_UNSIGNED_INT=4 -D SIZEOF_UNSIGNED_LONG=4 -D SIZEOF_UNSIGNED_LONG_LONG=8 \
  -D SECONDARY_DJW -D SECONDARY_FGK -D SECONDARY_LZMA"

emcc -c "$BASE/xdelta/xdelta3/xdelta3.c" -o "$OBJS/xdelta3.o" $CFLAGS
emcc -c "$BASE/xdelta3-wasm.c" -o "$OBJS/xdelta3-wasm.o" $CFLAGS
emcc -o ./dist/xdelta3.js \
  "$XZ_BASE/src/liblzma/.libs/liblzma.a" \
  "$OBJS/xdelta3.o" "$OBJS/xdelta3-wasm.o" \
  $FLAGS \
  -s ENVIRONMENT="worker" \
  -s EXPORTED_RUNTIME_METHODS="['callMain','UTF8ToString','HEAP8']" \
  -s EXPORTED_FUNCTIONS="['_main']" \
  -s INVOKE_RUN=0 \
  -s INITIAL_MEMORY=33554432 \
  -s ALLOW_MEMORY_GROWTH=1 \
  -s ABORTING_MALLOC=1 \
  -s MODULARIZE=1 \
  -s EXPORT_ES6=1 \
  -s EXPORT_NAME=createXdelta3Module
