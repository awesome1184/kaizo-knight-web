# Kaizo Knight — Attack Practice Lab

A lightweight, independently written browser battle lab based on the attack roster found in the supplied Kaizo Knight v3.0 build. It uses original vector effects and original JavaScript gameplay code; it does not bundle Deltarune's executable, game data, sprites, sound effects, or the DEVICE_KNIGHT source tree.

## Play

The GitHub Pages site opens directly into the attack lab. Choose **PRACTICE** to repeat one pattern or **FULL SEQUENCE** to play through the four listed phases.

Controls:
- Move: WASD or arrow keys
- Focus movement: Shift
- Confirm/FIGHT: Z, Space, or Enter
- Cancel/guard: X or Escape
- Restart: R
- Pause: P

Passing close to projectiles earns graze points. After each dodge section, use FIGHT, ACT, ITEM, or GUARD.

## Scope and accuracy

Attack names and the phase/variant roster were extracted from the supplied patched Kaizo Knight v3.0 game file. This first independent version implements the broad attack families (star patterns, blade rain, tunnels, multi-slashes, diamonds, swords, frenzy combinations, splitters, piercing blades, rising attacks, roaring, vortexes, soul splitters, quickslashes and cross attacks).

It is **not** a byte-for-byte port of the mod and is not frame-accurate. Projectile timing, collision geometry, attack sequencing, and visuals are original approximations. The original mod's compiled bytecode was not decompiled into this project. The simulator currently contains a practice loop and a simplified four-phase sequence, not the full RPG battle system.

## Credits and provenance

- Kaizo Knight v3.0 mod and attack roster: EnderCat8 and contributors.
- Deltarune remains the property of its respective rights holders.
- This project is an unofficial fan-made practice implementation and is not affiliated with Toby Fox.
