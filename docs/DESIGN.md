# Pokémon Solus Red and Blue – Design Document

A ROM hack of Gen 1 Pokémon games using the [pokered](https://github.com/pret/pokered) disassembly project.

## Goal

The goal of the project is to stay very close to vanilla, modifying only what is necessary to achieve some quality of life improvements, actual bug fixes, and changes that allow the game to be:

1. focused on solo play (e.g. mitigating the issues that trade evolutions introduce)
2. focused on being an “all-encompassing” Gen 1 game (i.e. as if only a single version existed for the sake of the acquisition of all feasible Pokémon, meaning essentially everything except Mew)

## Vision

The game should allow the player to play the game *mostly as intended*, that is, it should not tweak any type matchups, Pokémon stats, move effects, locations, story, overall difficulty, etcetera. This is true even of those aspects which many people use as “evidence” for the game’s overall “badness”, like that there are not enough of X type of Pokémon/move, or the gym leaders’ teams are not balanced, etcetera. For this project, I am accepting all the faults that exist in Gen 1 design-wise, with the exception of the ones I will outline below because I believe they will allow the game to be a truer experience of what Gen 1 “should” have been, even with its faults.

## Improvements

The creative liberties I plan to take:

- Pokémon which evolve via trade should be obtainable by the player via a “[tradeback NPC](https://github.com/pret/pokered/wiki/Adding-an-NPC-that-will-trade-your-own-Pokémon-back-for-evolution-purposes)”
- All Pokémon which are reasonably obtainable in any of the Gen 1 games (Red/Blue/Green/Yellow) should be obtainable (excluding Mew, probably), and one or more of the following things should also be true:
    - the Pokémon which are typically only obtainable from an in-game trade (like Mr. Mime) should be placed somewhere in the wild instead
    - traded Pokémon [should not receive “boosted EXP” nor disobey their trainer if overleveled](https://github.com/pret/pokered/wiki/Adding-an-In-Game-Trade)
    - in-game trade NPCs other than the Tradeback NPC should be disabled
- HMs should be usable in the field without taking up a Pokémon’s move slot

## Bug fixes

Some bugs could be fixed if they’re important enough, and if they are obvious mistakes from what the developers intended.

- Focus Energy should work as intended


## Green version examples

- [https://www.romhacking.net/hacks/876/](https://www.romhacking.net/hacks/876/)
- [https://github.com/Vortyne/pureRGB](https://github.com/Vortyne/pureRGB)

## Possible names

- Neo Red
- Truer Red
- Solo Red
- Red ex
- Lone Red
- Solus Red

## Possible implementation ideas

- merge the changes from Red/Blue so they are the same
- add a Green version (color palette, title screen)
- change sprites for Pokémon and gym leaders
- check Shin Pokémon change log for ideas
- Perhaps Mew could be obtainable? Cinnabar Mansion? Overworld sprite?