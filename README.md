# Pokémon Solus Red and Blue

This is a ROM hack of Pokémon Red/Blue for Game Boy, based on the Pokémon Reverse Engineering Team's [disassembly of Pokémon Red and Blue](https://github.com/pret/pokered).

For a detailed summary of all the changes in this ROM hack, check the [changelog][changelog].

## Table of Contents
- [Description](#description)
- [Installation and setup](#installation)
- [Resources](#resources)

## Description

Solus Red/Blue is a near-vanilla ROM hack of Gen 1. It changes **only a few things**, without overhauling so much that the game ceases to be Gen 1, and the whole things becomes a Ship of Theseus paradox.

So what things does this ROM hack change, and why?

### 1. All Pokémon obtainable in Red, Blue, or Green versions are obtainable through normal means

"Normal means" are one of the following:
- the Pokémon can be caught in the wild
- the Pokémon can be evolved into
    - in the case of trade evolutions, they are evolvable via a "Tradeback NPC" (i.e. no reliance on real-life Link Cable trading)
- the Pokémon can be found in a Poké Ball in the overworld
- the Pokémon can be battled (and caught) via interacting with its sprite in the overworld
- the Pokémon can be gifted to the player
- the Pokémon can be purchased
- the Pokémon can be restored from a fossil

This change allows for both a more "solo" experience of the game (not relying on trading to obtain certain Pokémon) and for a more diverse (and arguably "natural", in a Kantonian sense) selection when party building.

### 2. HMs can be taught to party Pokémon without using up one of the Pokémon's move slots

HMs, as well as TMs 28 (Dig) and 30 (Teleport), can be taught to a party Pokémon in a separate "Field Move" slot. When teaching one of these moves to a Pokémon, you will be prompted to choose whether it should be taught as its temporary Field Move (only one can be known per Pokémon). On a related note, those two TMs which act as Field Moves will not be consumed when used, but all other TMs will be.

When a Pokémon with a temporary Field Move is deposited into the PC, its Field Move will be erased.

This change allows for more emphasis on a Pokémon's battle moveset.

### 3. Some bugs are fixed

A small subset of the _actual_ bugs from the vanilla games are fixed.

## Installation

Learn how to install prerequisites and compile the ROM in the [install guide][installation].

## Resources

- Detailed [changelog][changelog] containing all of the changes made to the vanilla games
- My original [design document][designdoc] for this project
- My [justifications][justifications] for the changes I've made to the vanilla game
- The [pokered disassembly wiki][wiki] which has many helpful tutorials on working with the assembly code, some of which were used for this project
- [jojobear13][jojobear13]'s [shinpokered ROM hack][shinpokered] (thanks to him for the temporary Field Move implementation in his ROM hack)



[wiki]: https://github.com/pret/pokered/wiki
[shinpokered]: https://github.com/jojobear13/shinpokered
[designdoc]: DESIGN.md
[changelog]: CHANGELOG.md
[justifications]: JUSTIFICATIONS.md
[installation]: INSTALL.md
[jojobear13]: https://github.com/jojobear13

