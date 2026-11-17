# Kaizo Knight Web

A browser-playable Kaizo Knight Chapter 3 encounter.

## Play

1. Open the GitHub Pages site.
2. Select the Kaizo Knight v3.0 ZIP.
3. Select your own **unmodified Deltarune Chapter 3 v0.0.105 `data.win`** file.
4. Choose **PATCH AND PLAY**.

The patch is applied locally in a Web Worker using xdelta3/WebAssembly. Your `data.win`, mod ZIP, and patched output are not uploaded to the site or committed to this repository. The mod patch, optional soundtrack, and included save can be remembered locally in the browser; the game data file is always selected from your device.

The patch checks the exact base using xdelta's source checksum. A checksum mismatch means the selected `data.win` is not the required clean v0.0.105 file. Verify Deltarune's files through Steam to restore the original file, then try again.

## Runtime

The page uses a pinned revision of [awesome1184/deltarune-web](https://github.com/awesome1184/deltarune-web) for the GameMaker browser runtime and Chapter 3 external assets. The game's Chapter 3 archive is supplied by the player at launch, not distributed by this repository.

## Development

The xdelta3 WebAssembly decoder is built from [jmacd/xdelta](https://github.com/jmacd/xdelta), with the worker bridge adapted from [kotcrab/xdelta-wasm](https://github.com/kotcrab/xdelta-wasm). See [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).

GitHub Actions builds the WebAssembly decoder and deploys the static site to GitHub Pages.
