# Pokémon Solus RGB: Changelog

An overview of the changes made in each release.

## v1.3
- Changed wording in Field Move teaching prompt: "Learn this as a temporary FIELD MOVE?" -> "Teach this as a temporary FIELD MOVE?" 
- Changed Blaine's sprite to the Silph President sprite, like in Yellow Version
- Changed type matchup for `GHOST -> PSYCHIC` to 2x effectiveness (Super Effective) instead of 0x effectiveness
- Changed move typing for Karate Chop, Gust, and Sand-Attack to match the Gen 2 updates (now `FIGHTING`, `FLYING`, and `GROUND` respectively)
- Added an animated in-battle EXP bar to the HUD
- Added an in-battle 'caught Pokémon indicator' to the HUD (the icon is the one used in Gen 2)
- Implemented partially forward-patched learnsets via Gen 2 tradeback learnsets (check [here](./FEATURES.md#learnsets) for details)
- Added TM51 (Flamethrower), TM52 (Fire Punch), TM53 (Ice Punch), and TM54 (Thunderpunch) to support the newly forward-ported Pokémon learnsets
    - The TM pamphlet on the top floor of Celadon Mansion has been updated accordingly (the text now mentions 54 TMs instead of 50)
- Added Bill's father, a new NPC in Bill's grandfather's house in Fuchsia City; he will sell you a Flamethrower TM for 8000p (as he is the Move Tutor in Crystal Version who teaches Flamethrower, he is fit for the role)
- Added new Clerk on 2F of Celadon Dept. Store who sells the 3 new elemental punch TMs
- Moved the 3 Field Move TMs (Dig, Teleport, Softboiled) to the new Clerk on 2F of Celadon Dept. Store (instead of the vanilla TM Clerk)
- Updated credits; they now make references to:
    - Solus developer (me)
    - Game disassembly (pret)


## v1.2
- Bugfix: The post-game Professor Oak battle wouldn't trigger even after becoming the Champion

## v1.1
- Updated Pokémon learnsets, catch rates, and Level 1 moves to match those in Yellow Version

## v1.0
- Initial release
- Custom title screens for each of the 3 versions
- Green version-specific GBC and SGB palette changes for Solus Green
- All 151 Pokémon are obtainable
- Mew as a static battle
- An in-game trader NPC who will help you evolve the 4 trade evolutions lives in Celadon City
- HMs can be taught to party Pokémon in separate Field Move slots
- Battle sprites have been updated
    - Back sprites are now 48x48
    - Some front sprites have been updated to ones from other releases within Gen 1
- Post-game Professor Oak battle
- Battle theme changes for some Elite Four members
- A few vanilla bugfixes
