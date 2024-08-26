# Changelog

This file details the changes this ROM hack makes to the vanilla Pokémon Red/Blue games.

## Bug fixes
### Multi-player battle engine
- Moves that have 100% accuracy will miss in 1/256 uses
- Moves that have a 100% chance to critical hit will not crit in 1/256 uses
- Focus Energy quarters the critical hit chance instead of quadrupling it when used
- Substitute may leave the user with 0 HP after it's used
- Dual-type move effectiveness may be misreported
- HP draining moves and Dream Eater may hit when they shouldn't
- PP restoring items do not account for PP Ups when used
- Unexpected Counter damage
- Bide damage doesn't get cleared properly in link battles if you are the host
- Struggle may not function correctly if any move has at least one PP Up
- Psychic/Psywave/Night Shade's animation doesn't wiggle the top 3 screen lines
- Psywave can desync a link battle
- Fly and Dig do not remove the invulnerable status when prevented from reaching their second stage by paralysis or confusion damage
- Healing moves will fail if max HP is 255 or 511 points higher than current HP
- Switch-out messages do not account for underflow
- Haze can prevent a Pokémon from attacking after curing freeze

### Single-player battle engine
- Transformed Pokémon are no longer assumed to be Ditto (done)
- The Pokémon behind the Ghost is identified as seen in the Pokédex even if you didn't use the Silph Scope on it
- Ghost Pokémon can be identified without the Silph Scope
- Move swap sound is played in the wrong bank
- Exp. All gives half of the EXP of one participant instead of all participants
- Status-curing items remove stat modifiers
- AI trainer HUD does not update when it uses healing items
### Game engine
- Cinnabar Island's left-facing shore tiles point to invalid Pokémon
- Lt. Surge's gym trash cans do not use the proper trash cans for the locks
- A sign in Route 16 isn't readable at its front
- The player can jump a ledge to land on top of an NPC
- Falling through a hole on the Bicycle doesn't reset the music
- The Item Finder won't detect items at X or Y coordinate 0
- NPCs can treat the bottom row or the rightmost column of a map as offscreen
- NPC movement delay can be higher than it should be
- NPCs can randomly load at the corner of the screen when you first enter an area
- Trainers' end battle text 2 isn't read correctly
- Smoke puffs from Strength boulders don't show up correctly
- GetBattleTransitionID_IsDungeonMap fails to recognize some maps as dungeon maps
- The lucky slot machine in the Game Corner doesn't stop when it should if you get a 7
- The lucky slot machine in the Game Corner doesn't stop when it should if there are two 7s or BARs on the middle or bottom of the wheel
- The hidden 40-coin stash in the Game Corner only gives half
- The splash screen adds 2 more stars than it should
- The PC screen in the healing machine doesn't flash correctly
- NPCs can receive the wrong movement byte and behave incorrectly
### Graphics
- Sliding of trainer and Pokémon graphics can cause tearing
- The lower-right tile of Pokémon backsprites are deleted when sliding offscreen
- Minimize and Substitute can cause sprite glitches with enemy Pokémon
- Double Edge looks weird when the opponent uses it
### Audio
- The battle victory music can sometimes play at the wrong time
- Prof. Oak's lab music can sometimes play with a channel cut off
- The 'acquired an item' jingle can sometimes be cut off
- The audio engine may borrow from the high byte of the wrong frequency
- Articuno's cry may get distorted when you see it in the binoculars on Route 15/Fossils play their Pokémon's cry when they shouldn't in Pewter Museum
- The Prof. Oak introduction uses Nidorina's cry instead of Nidorino's
### Text
- The text used by Prof. Oak when he gives you 5 Pokéballs overwrites the second line with the last line
- An in-game trade NPC talks about an 'evolving Raichu'
- The text used by one of the Route 8 battles has text cut off
### Scripted events
- The lucky slot machine in the Game Corner can be the nonexistent slot machine 255 (-1)
- Saving Mr. Fuji and warping to his house doesn't let you immediately leave


## Mistake fixes
- Koffing's sprite is reverted to R/G to fix skull pattern

## Battle sprite changes

If a Pokémon is present in this table, it means its original battle front sprite (from Red/Blue) was changed to either the one from Red/Green (JPN) or the one from Yellow. TODO add spoiler pictures for each one of these?

Pokémon | Source for new sprite
--- | ---
Abra, Kadabra, Alakazam | Yellow
Aerodactyl | Red/Green (JPN)
Ekans, Arbok | Yellow
Growlithe, Arcanine | Yellow
Articuno, Zapdos, Moltres | Yellow
Weedle, Kakuna, Beedrill | Red/Green (JPN)
Bellsprout, Weepinbell, Victreebel | Yellow
Squirtle, Wartortle | Yellow
Blastoise | Red/Green (JPN)
Bulbasaur, Ivysaur, Venusaur | Yellow
Charmander, Charmeleon, Charizard | Yellow
Metapod | Red/Green (JPN)
Chansey | Red/Green (JPN)
Clefable | Red/Green (JPN)
Shellder | Yellow
Cloyster | Red/Green (JPN)
Cubone | Red/Green (JPN)
Marowak | Yellow
Seel | Red/Green (JPN)
Dewgong | Yellow
Diglett, Dugtrio | Red/Green (JPN)
Doduo, Dodrio | Red/Green (JPN)
Dratini | Red/Green (JPN)
Dragonair, Dragonite | Yellow
Drowzee, Hypno | Red/Green (JPN)
Eevee | Yellow
Electabuzz | Red/Green (JPN)
Magmar | Red/Green (JPN)
Electrode | Red/Green (JPN)
Exeggcute, Exeggutor | Red/Green (JPN)
Farfetch'd | Yellow
Spearow | Yellow
Fearow | Red/Green (JPN)
Flareon | Yellow
Jolteon | Red/Green (JPN)
Gastly, Haunter, Gengar | Yellow
Geodude, Golem, Graveler | Yellow
Oddish, Gloom | Yellow
Zubat, Golbat | Yellow
Goldeen, Seaking | Red/Green (JPN)
Golduck | Red/Green (JPN)
Magikarp | Red/Green (JPN)
Hitmonchan | Yellow
Hitmonlee | Red/Green (JPN)
Seadra | Yellow
Jigglypuff, Wigglytuff | Yellow
Jynx | Red/Green (JPN)
Kabuto, Kabutops | Yellow
Kangaskhan | Red/Green (JPN)
Krabby, Kingler | Red/Green (JPN)
Koffing, Weezing | Red/Green (JPN)
Lapras | Yellow
Lickitung | Red/Green (JPN)
Machop, Machoke, Machamp | Yellow
Mankey, Primeape | Yellow
Meowth, Persian | Yellow
Mew | Red/Green (JPN)
Mewtwo | Red/Green (JPN)
MR. Mime | Red/Green (JPN)
Nidoran M, Nidoran F | Yellow
Nidorino, Nidorina | Red/Green (JPN)
Omanyte, Omastar | Yellow
Onix | Red/Green (JPN)
Paras, Parasect | Red/Green (JPN)
Pidgey, Pidgeotto, Pidgeot | Yellow
Pikachu | Red/Green (JPN)
Raichu | Yellow
Pinsir | Yellow
Poliwag, Poliwhirl, Poliwrath | Yellow
Rapidash | Yellow
Rattata, Raticate | Red/Green (JPN)
Rhyhorn, Rhydon | Red/Green (JPN)
Sandshrew, Sandslash | Yellow
Slowbro | Red/Green (JPN)
Snorlax | Yellow
Staryu, Starmie | Red/Green (JPN)
Tangela | Red/Green (JPN)
Tauros | Red/Green (JPN)
Tentacruel | Red/Green (JPN)
Venonat, Venomoth | Red/Green (JPN)
Vulpix, Ninetales | Yellow
Porygon | Red/Green (JPN)

