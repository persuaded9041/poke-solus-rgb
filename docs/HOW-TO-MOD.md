# Pokémon Solus RGB: How to modify or remove certain features

_Note_: This document is a work in progress.

This document details how to make tweaks to (or remove) certain things that were added in the Pokémon Solus RGB romhack. If there are some things you don't like about the romhack, you can change them before building the ROMs. Or if you want to use this romhack as a starting point for your own romhack, this document can help you get started making some changes (if you do this, all I ask is that you [change the title screens](#revert-the-title-screen) so they don't say "Solus" in your romhack).

Jump to:
- [Disposable TMs](#disposable-tms)
- [Sprites](#sprites)
- [Revert the title screen](#revert-the-title-screen)

## Disposable TMs
To have TMs treated like HMs, meaning they won't be depleted after use.

In `engine/items/item_effects.asm`, search for `dereknote` and uncomment these three lines:
```
;;;;;;;;;; dereknote - these three lines would treat learning a field move from a TM the same as a HM, meaning TMs wouldn't get depleted
;xor a
;cp c
;ret c
;;;;;;;;;;
```

## Sprites
TODO: Add these instructions after the feature to change sprite sets is implemented.

## Revert the title screen
TODO: Explain how to do this.