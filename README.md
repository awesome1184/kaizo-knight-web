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
