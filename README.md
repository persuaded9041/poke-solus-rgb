# Pokémon Solus RGB

A romhack of Pokémon Red/Blue for Game Boy, based on the Pokémon Reverse Engineering Team's [disassembly of Pokémon Red and Blue][pokered].

For a detailed summary of all the changes in this romhack, check out the [feature log][featurelog].

## Table of Contents
- [Description](#description)
- [Building the ROMs](#building-the-roms)
- [Resources](#resources)

## Description

**Pokémon Solus RGB** is a near-vanilla romhack of Gen 1. It changes _only a few things_ from the original games, without overhauling so much that it ceases to be Gen 1, and the whole thing becomes a [Ship of Theseus](https://en.wikipedia.org/wiki/Ship_of_Theseus) paradox.

### Versions
[Compiling this project](#building-the-roms) will yield three ROMs:

- Solus Red (`pokered.gbc`)
- Solus Green (`pokegreen.gbc`)
- Solus Blue (`pokeblue.gbc`)

Solus Green is inspired by the original Japanese release of Green. The differences between versions are only cosmetic (palettes, title screen text, etc.), as this project consolidates any of the meaningful version-specific differences that existed across versions, such as Pokémon availability.

### What does this romhack change, and why?

#### 1. All 151 Pokémon are obtainable through normal means

"Normal means" are one of the following:
- the Pokémon can be caught in the wild
- the Pokémon can be evolved into
    - in the case of trade evolutions, they are evolvable via a "trade-back NPC" (i.e. no reliance on real-life Link Cable trading)
- the Pokémon can be found in a Poké Ball in the overworld
- the Pokémon can be battled (and caught) via interacting with its sprite in the overworld
- the Pokémon can be gifted to the player
- the Pokémon can be purchased
- the Pokémon can be restored from a fossil

This change allows for both a more enhanced "solo" experience of the game (not needing to rely on trading to obtain certain Pokémon) and for a more diverse (and arguably "natural", in a Kantonian sense) selection of Pokémon when party building.

#### 2. HMs can be taught to party Pokémon without using up one of their move slots

HMs, as well as TMs 28 (Dig) and 30 (Teleport), can be taught to a party Pokémon in a separate "Field Move" slot. When teaching one of these moves to a Pokémon, you will be prompted to choose whether it should be taught as its temporary Field Move (only one can be known per Pokémon). On a related note, those two TMs which act as Field Moves will not be consumed when used (but all other TMs will be).

When a Pokémon with a temporary Field Move is deposited into the PC, its Field Move will be erased.

This change allows for more emphasis on a Pokémon's battle moveset.

#### 3. Some new content is added, and some visual content is changed

A _very small amount_ of new battles/signs/houses/NPCs were added. They are either added to restore cut content, or to support a newly implemented feature. To see them all, please check the ['New content' section of the feature log][newcontent].  

Additionally, _some_ visuals of the original games are changed, and sometimes in accordance with my own personal preferences. To read more about this, go to the [feature log][featurelog] and search for "sprites".

#### 4. Some bugs/oversights are fixed

A small subset of the bugs/oversights from the vanilla games are fixed. Visit the [feature log][featurelog] for details.

## Building the ROMs

If you're new to the `pokered` disassembly, learn how to install prerequisites and compile the ROM in the [install guide][installation].

Otherwise, if your environment for compiling the vanilla ROMs is already set up, the procedure here is the same. Just clone this repository, `cd` into it, and run `make`.

## Resources

- The original [pokered][pokered] disassembly which this romhack is based on
- Detailed [feature log][featurelog] containing all of the changes made to the vanilla games
- My original [design document][designdoc] for this project (FYI: some things have changed since I wrote this)
- The [pokered wiki][wiki] which has many helpful tutorials on working with the source code, some of which were used for this project
- The [pret Discord server][pretdiscord]
- [Shin Pokémon romhack][shinpokered] (temporary Field Move implementation was taken from here)
- [Polished Map map/tileset editor][polishedmap]

## Credits
Thank you to the entire [pret Discord server][pretdiscord] and these individuals who were very helpful throughout my work on this project:
- [jojobear13][jojobear13]
- [Vortyne][Vortyne]



[pokered]: https://github.com/pret/pokered
[wiki]: https://github.com/pret/pokered/wiki
[pretdiscord]: https://discord.gg/d5dubZ3
[shinpokered]: https://github.com/jojobear13/shinpokered
[designdoc]: docs/DESIGN.md
[featurelog]: docs/FEATURES.md
[newcontent]: docs/FEATURES.md#new-content
[installation]: docs/INSTALL.md
[polishedmap]: https://github.com/Rangi42/polished-map
[jojobear13]: https://github.com/jojobear13
[Vortyne]: https://github.com/Vortyne

