# Pokémon Solus RGB: Feature Log
This file details all the changes the Pokémon Solus RGB romhack makes to the vanilla Pokémon Red/Blue games. To compare previous releases, check the [changelog](CHANGELOG.md).

**SPOILER WARNING**: While this romhack takes minimal creative liberties and doesn't add _too many_ new things, the entirety of this document could be considered a spoiler. If you don't want to be spoiled to any of the changes, then don't read this document.

## Table of Contents
- [Motivation](#motivation)
- [Justifications](#justifications)
- [Version differences](#version-differences)
- [Changes and fixes](#changes-and-fixes)
    - [Palette](#palette)
    - [Title screen](#title-screen)
    - [Battle sprites](#battle-sprites)
    - [Wild encounters](#wild-encounters)
    - [Learnsets](#learnsets)
    - [Game Corner](#game-corner)
    - [Music](#music)
    - [Text](#text)
    - [Default player names](#names)
    - [Vanilla bugfixes](#vanilla-bugfixes)
- [New content](#new-content)
    - [New features](#new-features-that-were-not-in-the-vanilla-games)
    - [Restored cut content](#cut-content-that-has-been-restored)

## Motivation

This romhack is very much a "my version" of Gen 1. You could also consider it a "purist's version". The decisions made were inspired by _my idea_ of what an "enhanced" version of Gen 1 would look like. I wanted to make this romhack so that I could actually use it for my own personal routine playthroughs of Gen 1 every few months.

The modifications mostly consist of logical changes to address some problems which most people would agree _are_ problems, with a sprinkling of my personal preferences on top (such as changing some battle sprites to ones from other Gen 1 games). I also didn't want to go overboard fixing bugs. A lot of the vanilla bugs can be seen as contributing to what makes Gen 1 special. All of this to say: you might not agree with some of my decisions!

Q: What is this romhack trying to solve?

> This romhack hopes to solve the following general "issue" categories in vanilla Gen 1:
> 1. All 151 Pokémon are not obtainable in one game
> 2. Pokémon with the "trade" evolution method cannot be evolved except with a friend's help, or by using two cartridges
> 3. HMs compromise a Pokémon's potential by occupying its battle move slots
> 4. Some bugs exist which arguably detract from the developers' original vision for the games (those bugs in the codebase which change some gameplay element from what is very likely the intended behavior) 

## Justifications

Here are some questions which might be asked about the decisions made for this romhack.

Q: Why is it called Solus?
> The definition of 'solus' is something like: 'By oneself; alone. Used as a stage direction to a male character.'
> I think it complements the philosophy of the romhack, in that it highlights the 'solo' aspect of the game. The game is meant to be
> played by yourself (without relying on friends to trade) and all elements of the game are accessible in one ROM, i.e., 
> you don't need to rely on multiple versions to accomplish anything. The 'stage direction' bit is also relevant; the Pokémon games can sort of
> be thought of like a play, I guess. The fact that 'solus' is usually used for male characters is a bonus, since the 
> protagonist of Red/Blue is a young boy.

Q: How did you decide where to put previously unobtainable Pokémon?
> If a Pokémon was version-exclusive, then its appearance was simply merged with the opposite game's counterpart Pokémon (Oddish vs. Bellsprout, for example — now both appear in the same locations where you'd previously only find one). For the cases where it wasn't this simple, you can find the justification for each decision in the table below. Some Pokémon were added to the wild if their previous acquisition method was only in the Game Corner, or only via trade, or if only one existed and multiple are needed for Dex completion (like Eevee).

Pokémon | Justification for location decision
--- | ---
Farfetch'd | added to Routes 12 and 13 @ 5% (like in Yellow)
Lickitung | added to Safari Zone (West) @ 1% (like JPN Blue)
Mr. Mime | added Route 21 @ 5% (like in Gen 2)
Hitmonchan/Hitmonlee | added Hitmonchan to Victory Road 2F and Hitmonlee to Victory Road 3F (similar to LGPE) 
Bulbasaur | added to Viridian Forest @ 1% (similar to LGPE)
Squirtle | added to Seafoam Islands B3F and B4F @ 1% (similar to LGPE) because those 2 maps are the ones with water
Charmander | added to both floors of Rock Tunnel @ 1% (similar to LGPE)
Omanyte/Kabuto | added 2 additional fossils (1 Helix and 1 Dome) in Victory Road because it's late enough in the game that it would prevent you from using them in your main party
Eevee | added to Route 17 @ 5% (similar to LGPE)
Porygon | added a scientist who works for Pokémon Lab on Cinnabar Island who sells you one for 10000p "illegally" (this is where Porygon was created originally); The price was determined because it's _around_ 10% (a bit less) of the Game Corner cost after doing coin conversion if you use the 6500c price (6500 coins @ 1000p per 50c = 130000p x 10% = 13000p).
Mew | added a static encounter in a new room of Cinnabar Lab basement (technically B2F); The thematic reasoning is a bit ambiguous... it could be interpreted as Mew "coming back" to the building where its DNA was used to create Mewtwo, in order to find Mewtwo... or it could be seen as the "original" Mew that was used for experimentation (whether Mew was ever present in this building or if DNA was taken from the jungle is not clear in the lore) now hiding somewhere in this building. The new room's entrance is surrounded by rocks as if a hole was broken in the floor by Mew. It's level 30 (like in Emerald).

Q: Why did you think it was OK to change the Game Corner prize window Pokémon?
> Since all version-exclusive Pokémon appearances in the game were merged, I also removed the version-exclusives in the Game Corner. Their locations
> between both prize windows were swapped around a bit, and now the second window is identical to the one in Gold/Silver's Celadon Game Corner. I 
> thought this made sense thematically. Additionally, if a Pokémon appears in either prize window, its level/price are consistent with another
> occurrence of that same Pokémon in another game's prize window.
> 
> I also view obtaining Pokémon at the Game Corner as kind of an "extra" method (aside from Porygon in the original games). For that reason, I didn't think changing the layout of the prize windows was too detrimental to the Game Corner's role.

Q: Why did you change the battle sprites?
> I think the "best" battle sprite for some of the original 151 Pokémon exist in the other Gen 1 releases. For this reason, I looked at each sprite (from Red/Blue, Yellow, or JPN Red/Green) and chose my favorite sprite for each Pokémon. Those picks are the ones I decided to use for Solus RGB. So yes, this was subjective. If you disagree with some of the choices, feel free to clone the repo and change them for yourself. :)

## Version differences
The differences between the three versions of this romhack (_Solus Red_, _Solus Green_, _Solus Blue_) are solely cosmetic. Specifically, these things differ:
1. Title screen version text
2. Title screen Pokémon carousels (matches the original releases' carousels)
3. Game Boy Color "duochrome" palettes (matches the original releases' GBC palettes)
4. Super Game Boy palettes (which affect only title screen, SGB border graphics, and Game Corner slots)
5. End credits text: "RED/GREEN/BLUE VERSION STAFF" (depending on version)

## Changes and fixes
### Palette
- Solus Green's palette on Game Boy Color hardware (or an emulator running in GBC mode) matches that of the original Japanese release for Green Version (green overworld, red sprites).
- Green Version-specific border and palette were restored for Super Game Boy for Solus Green, to match those of the original Japanese release for Green.
- Green Version-specific Super Game Boy palette for the Game Corner slots were restored for Solus Green.

### Title screen
- The "Red Version"/"Green Version"/"Blue Version" text on the title screens has been changed to reflect the name of the romhack. The "Version" text has been removed from each, and "Solus" has been added to the beginning. They now read "Solus Red"/"Solus Green"/"Solus Blue". 
- The title screen Pokémon carousel for Solus Red, Solus Green, and Solus Blue have all been changed so that the Pokémon that are cycled through match those of the original Japanese releases for Red/Green/Blue (carousel variants [here][titlecarousels] for reference).

<p align="center">
<img src="../screenshots/solusred.bmp">
<img src="../screenshots/solusgreen.bmp">
<img src="../screenshots/solusblue.bmp">
</p>

### Battle sprites
- The in-battle back sprites (including the player and the Old Man) have been updated to display at a higher resolution of 48x48. Since this meant that new back sprites needed to be supplied for every Pokémon, they all use the back sprites featured in the [Spaceworld 1997 Gold/Silver beta][spaceworld].

- If a Pokémon is present in the below table, it means its original battle front sprite (from Red/Blue) was changed to either the one from Red/Green (JPN) or the one from Yellow. If it's not present in this table, it means it still uses its original Red/Blue sprite. These were changed according to my own personal preference (whichever ones I thought were the best).

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
Mr. Mime | Red/Green (JPN)
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

### Wild encounters
- Maps which had version-exclusive Pokémon have been "merged", i.e., adjusted so that both (or all, if a map had multiple) version-exclusive Pokémon are available in that map. In these cases, occassionally, liberties needed to be taken to ensure a Pokémon could fit into the maps maximum encounter slots. I chose to prioritize keeping all of the Pokémon in that map rather than maintaining the encounter rates for certain Pokémon, so sometimes a Pokémon's encounter rate has been adjusted slightly.
- The number of wild encounters slots per route has been increased from 10 to 12, in order to make room for those maps which needed an extra slot to accommodate the opposite version's exclusive Pokémon. For the maps which didn't need any adjusting for version exclusives, I simply took the 3rd slot (previously 15%, but dropped by 5% to 10%) and copied that Pokémon into the new 2nd-to-last and 3rd-to-last slots
(4% and 1% respectively). This means the distributions are almost identical to the originals, +/- a fraction of a %.

### Learnsets
Learnsets (level-up moves and teachable TMs/HMs) and catch rates for all Pokémon have been updated to match those used in Yellow version. For a look at the full diff for this change, check [this commit](https://github.com/Dechrissen/poke-solus-rgb/commit/99459edfa1d797d72a273c8a412545fe85f08594).

The updated learnsets are not _too_ signifiant. Some changes are nice, however. Notable updates are:
- Charizard can learn HM Fly
- Diglett and Dugtrio can learn HM Cut
- Kabutops can learn HM Cut
- Venonat, Venomoth, and Butterfree can learn HM Flash
- Nidoran learns Double Kick at Level 12 instead of 43 (Nidorino/Nidorina as well)
- Mankey learns Low Kick at Level 9
- Venonat learns Confusion at Level 19
- Pikachu has an expanded learnset including Thunderbolt at Level 26
- The Eevee-lutions learn their damaging STAB moves at earlier levels

### Game Corner
The Game Corner prize windows have been changed. The tables below reflect these changes.
#### Prize window 1
Pokémon | Level | Price
--- | --- | ---
Abra | 6 | 120
Clefairy | 12 | 750
Dratini | 18 | 2800

#### Prize window 2
Pokémon | Level | Price
--- | --- | ---
Mr. Mime | 15 | 3333
Eevee | 15 | 6666
Porygon | 20 | 9999

### Music
The Elite Four now all use the Gym Leader battle theme instead of using the default battle theme for the first three members (Lorelei, Bruno, Agatha).

### Text
There is a game-related poster on 3F of Celadon Dept. Store which now reads "Red, Green, and Blue! All are Pokémon!" instead of "Red and Blue! Both are Pokémon!" to be consistent with the triad of versions.

### Names
The default set of names for the player and the rival have been changed. These are based on some of the original names used in the Japanese Red & Green versions, mixed with the English names Ash and Gary. (If you're curious to read more about the default names, check [this Bulbapedia article](https://bulbapedia.bulbagarden.net/wiki/Red_(game)#Optional_names).)

Player name | Justification for name | Rival name | Justification for name
--- | --- | --- | ---
RED | Player character's canonical name | GREEN | Rival's canonical name
SATOSHI | Pokémon creator Satoshi Tajiri's name | SHIGERU | Based on Satoshi Tajiri's friend and fellow developer Shigeru Miyamoto
ASH | Based on the anime character Satoshi | GARY | Based on the anime character Shigeru



### Vanilla bugfixes
#### Battle engine bugfixes
- Transformed Pokémon are no longer assumed to be Ditto
- Focus Energy no longer quarters critical hit chance (it now quadruples it instead, as intended)
- Status-curing items no longer remove stat modifiers in battle
#### Graphical bugfixes
- Sliding of trainer and Pokémon graphics on screen no longer cause screen tearing
- The lower-right tile of Pokémon backsprites are no longer deleted when sliding offscreen
- Psychic/Psywave/Night Shade's animation now correctly wiggles the top 3 screen lines
#### Audio bugfixes
- The Prof. Oak introduction movie no longer uses Nidorina's cry (it now uses Nidorino's, as intended)
#### Oversight and other mistake fixes
- Koffing's sprite is reverted to the JPN R/G variant to fix incorrect skull pattern location

## New content
### New features that were not in the vanilla games
1. **Field move slots**

    - HMs, as well as TM28 (Dig), TM30 (Teleport), and TM41 (Softboiled), can be taught to a party Pokémon in a separate "Field Move" slot.
    - When teaching one of these moves to a Pokémon, you will be prompted to choose whether it should be taught as its temporary Field Move.
    - Only one Field Move can be known at a time per Pokémon.
    - Field Moves can be used like other HMs as normal, from a Pokémon's party sub-menu.
    - When a Pokémon with a temporary Field Move is deposited into the PC, its Field Move will be erased.
    - Those three TMs which act as Field Moves (Dig, Teleport, and Softboiled) are now sold by the TM salesman on the 2nd floor of Celadon Dept. Store, because they might be lost more easily if taught as a Field Move and then erased via PC deposit.
        - TM28 (Dig): 2000p
        - TM30 (Teleport): 1000p
        - TM41 (Softboiled): 2000p
    - A new sign on Route 14, east of Fuchsia City, advertises these three TMs for sale at Celadon Dept. Store. Notably, there was already a trainer on this route who mentions TMs being on sale in Celadon.
    

2. **The Trader**

    - A new NPC who lives in a new house behind Celadon Dept. Store.
    - He will trade you back any of your Pokémon, for the purpose of evolving any of the four trade evolutions.
    - Only a single trade animation will play (not two one after the other).
    - Another new NPC, a boy in Pewter City, will hint at the Trader's location.
    - A new sign on Route 8, just outside of Lavender Town, further advertises the Trader's services and location.

3. **Porygon salesman**

    - A scientist in the lobby of Pokémon Lab on Cinnabar Island will offer to sell you a Porygon for 10000p. He shouldn't be selling it to you, so he does it in secrecy (even though he's being quite conspicuous in the lobby). 

4. **Victory Road fossil room**

    - A new basement room of Victory Road (B1F) holds two more fossils: a Helix Fossil and a Dome Fossil.
    - This allows you to get both fossils in the late game, so you can complete the Pokédex but you're still restricted to using only one of the two fossil Pokémon in your main party.

5. **Mew battle**

    - Mew is battleable as a static sprite in a new basement room of Cinnabar Mansion (B2F).
    - It's level 30.
    - The entrance to its room is surrounded by rocks, as if Mew broke a hole in the floor.

### Cut content that has been restored
1. **Prof. Oak battle**

    - Prof. Oak acts as a very strong end game opponent (akin to Red in Mt. Silver at the end of Gold/Silver).
    - His trainer data exists in the game's code, but goes unused in the vanilla games. Based on the player's starter Pokémon pick, Oak's party will vary (his party features the final, unpicked starter).
    - Battle dialogue for Oak is not present in the code; it was written by me.
    - After beating the Pokémon League, talk to Oak in his lab and decline his Pokédex evaluation offer. He will then offer to battle you.
    - You can battle him as many times as you'd like.
    <p align="center">
    <img src="../screenshots/oak_battle.png">
    </p>
    


[titlecarousels]: https://bulbapedia.bulbagarden.net/wiki/Game_intro#Pok%C3%A9mon_Red,_Green,_and_Blue
[spaceworld]: https://bulbapedia.bulbagarden.net/wiki/Pok%C3%A9mon_Gold_and_Silver_Spaceworld_%2797_demo