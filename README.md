# Pokémon Solus RGB

<p align="center">
<img src="screenshots/solusred.bmp">
<img src="screenshots/solusgreen.bmp">
<img src="screenshots/solusblue.bmp">
</p>

A romhack of Pokémon Red/Blue for Game Boy, based on the Pokémon Reverse Engineering Team's [disassembly of Pokémon Red and Blue][pokered].

For a detailed summary of all the changes in this romhack, check out the [feature log][featurelog].

Just want the patch? Go [here][releases].

## Table of Contents
- [Versions](#versions)
- [Description](#description)
- [Installation](#installation)
- [Links](#links)

## Versions

There are three versions of this romhack: _Solus Red_, _Solus Green_, and _Solus Blue_. The differences between versions are solely cosmetic (palettes, title screen text, etc.), as this project consolidates any of the meaningful version-specific differences that existed across versions, such as Pokémon availability. For a complete list of version differences, check the ["Version differences" section of the feature log][versiondifferences].

[Assembling the source code](#installation) will yield three ROMs:

- Solus Red (`pokesolusred.gbc`)
- Solus Green (`pokesolusgreen.gbc`)
- Solus Blue (`pokesolusblue.gbc`)

_A note on palettes_:  
Solus Green is inspired by the original Japanese release of Green Version. If played on Game Boy Color, you will see the GBC's mostly-green palette which was specifically intended for the Japanese release of Pokémon Green Version. (The same goes for Red and Blue: you will see their mostly-red or mostly-blue Game Boy Color palettes.) If played on Super Game Boy, the palette used for title screen, SGB border, and Game Corner slots will all be version-specific corresponding to Red, Green, or Blue versions.

## Description

**Pokémon Solus RGB** is a near-vanilla romhack of Gen 1. It changes _only a few things_ from the original games, without overhauling so much that it ceases to be Gen 1, and the whole thing becomes a [Ship of Theseus](https://en.wikipedia.org/wiki/Ship_of_Theseus) paradox.

### What does this romhack change?

#### 1. All 151 Pokémon are obtainable through normal means

"Normal means" are one of the following:
- the Pokémon can be caught in the wild
- the Pokémon can be evolved into via an in-game method
- the Pokémon can be found in a Poké Ball in the overworld
- the Pokémon can be battled (and caught) via interacting with its sprite in the overworld
- the Pokémon can be gifted to the player
- the Pokémon can be purchased
- the Pokémon can be restored from a fossil


#### 2. HMs can be taught to party Pokémon without using up one of their move slots

HMs, as well as TM28 (Dig), TM30 (Teleport), and TM41 (Softboiled), can be taught to a party Pokémon in a separate "Field Move" slot. When teaching one of these moves to a Pokémon, you will be prompted to choose whether it should be taught as its temporary Field Move (only one can be known at a time per Pokémon). Field Moves can be used like other HMs as normal, from a Pokémon's party sub-menu.

When a Pokémon with a temporary Field Move is deposited into the PC, its Field Move will be erased. Those three TMs which act as Field Moves (Dig, Teleport, and Softboiled) are now sold on the 2nd floor of Celadon Dept. Store, because they might be lost more easily if taught as a Field Move and then erased via PC deposit.


#### 3. Some new content is added, and some visual content is changed

A _very small amount_ of new battles/signs/houses/NPCs were added. They are either added to restore cut content, or to support a newly implemented feature. To see them all, please check the ['New content' section of the feature log][newcontent].  

Additionally, _some_ visuals of the original games are changed, and sometimes in accordance with my own personal preferences. To read more about this, check the [feature log][featurelog].

#### 4. Some bugs/oversights are fixed

A small subset of the bugs/oversights from the vanilla games are fixed. Visit the [feature log][featurelog] for details.

## Installation

### Patching a vanilla ROM

To patch a vanilla Pokémon Red Version ROM, download an `.ips` patch file from the [patches directory][patches], and then apply it to your ROM using [this online patcher](https://www.marcrobledo.com/RomPatcher.js/) or your patcher of choice.

### Building all three ROMs from source

If you're new to the [`pokered`][pokered] disassembly, learn how to install prerequisites and assemble the ROMs in the [install guide][installation].

Otherwise, if your environment for compiling the vanilla ROMs is already set up, the procedure here is the same. Just clone this repository, `cd` into it, and run `make`.

## Links

- The original [pokered][pokered] disassembly which this romhack is based on
- Detailed [feature log][featurelog] containing all of the changes made to the vanilla games
- My original [design document][designdoc] for this project (FYI: some things have changed since I wrote this)
- A [blog post][blogpost] I wrote about this project
- The [pokered wiki][wiki] which has many helpful tutorials on working with the source code, some of which were used for this project
- The [pret Discord server][pretdiscord]
- [Shin Pokémon romhack][shinpokered] (Field Move slot implementation was taken from here)
- [pokeworld][pokeworld] (a very helpful tool for visualizing the entire Kanto map)
- [Polished Map map/tileset editor][polishedmap]

## Credits
Thank you to the entire [pret Discord server][pretdiscord], the [pret][pret] team, and these individuals who were very helpful throughout my work on this project:
- [jojobear13][jojobear13], for help with the Field Move slot implementation
- [Vortyne][Vortyne], for a lot of general pokered-related help
- [Tiptup_Tooie][tiptup], for playtesting

## Support me
If you want to show your support, you could :star: this repository, or simply share it with someone.

Or if you want to make a small donation, my Ko-fi page is [here][kofi].

I'd appreciate any form of support!



[pokered]: https://github.com/pret/pokered
[pret]: https://github.com/pret
[wiki]: https://github.com/pret/pokered/wiki
[pretdiscord]: https://discord.gg/d5dubZ3
[shinpokered]: https://github.com/jojobear13/shinpokered
[designdoc]: docs/DESIGN.md
[featurelog]: docs/FEATURES.md
[newcontent]: docs/FEATURES.md#new-content
[versiondifferences]: docs/FEATURES.md#version-differences
[installation]: docs/INSTALL.md
[patches]: /patches
[releases]: https://github.com/Dechrissen/poke-solus-rgb/releases
[pokeworld]: https://www.extratricky.com/pokeworld/rb/1
[polishedmap]: https://github.com/Rangi42/polished-map
[jojobear13]: https://github.com/jojobear13
[Vortyne]: https://github.com/Vortyne
[tiptup]: https://www.twitch.tv/tiptup_tooie
[blogpost]: https://derekandersen.net/blog/pokemon-solus-rgb
[kofi]: https://ko-fi.com/dechrissen

