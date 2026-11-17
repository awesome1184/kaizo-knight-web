# Kaizo Knight Web

A browser-playable Kaizo Knight Chapter 3 encounter.

## Current implementation plan

The site will use the existing Deltarune Web browser runtime and apply the supplied Kaizo Knight xdelta patch locally in the browser. Visitors provide the Kaizo Knight v3.0 ZIP; the patch, optional soundtrack, and included save are processed on-device.

The base Chapter 3 archive is fetched from the matching public web-port repository. Copyrighted game data and the patched archive are not committed to this repository.

## Status

Initial project scaffold. The browser patcher and direct-to-fight launch path are being implemented.

## Source notes

- Kaizo Knight v3.0 requires unmodified Deltarune Chapter 3 v0.0.105.
- The existing web-port Chapter 3 archive chunks were verified byte-for-byte against the supplied data.win.
- The optional NekoPresence.dll is Windows-only and is not used by the browser version.


## Enable GitHub Pages

The first deployment requires a one-time repository setting because GitHub Pages is not enabled automatically by the workflow:

1. Open **Settings → Pages** in this repository.
2. Under **Build and deployment**, set **Source** to **GitHub Actions**.
3. The next push to `main` will run the WebAssembly build and publish the site.

The deployment workflow builds xdelta3 from source; it does not publish the original game archive or the mod patch.
