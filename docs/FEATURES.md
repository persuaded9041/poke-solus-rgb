# SolusRGB: Feature Log
This file details all the changes the SolusRGB romhack makes to the vanilla Pokémon Red/Blue games.

_Disclaimer_: The decisions made were inspired by _my idea_ of what a "better" version of Gen 1 would look like. It's mostly logical changes, with a sprinkling of my personal preferences on top (such as changing some battle sprites to ones from other Gen 1 games). I also didn't want to go overboard fixing bugs. A lot of them can be seen as contributing to what makes Gen 1 special. All of this to say: you might not agree with some of my decisions!

_Note_: While this romhack takes minimal "creative liberty" and doesn't add _too many_ new things, the entirety of this document can still be considered a spoiler. If you don't want to be spoiled to any of the changes, then don't read this document.

## Table of Contents
- [Justifications](#justifications)
- [Changes and fixes](#changes-and-fixes)
    - [Palette](#palette)
    - [Title screen](#title-screen)
    - [Battle sprites](#battle-sprites)
    - [Encounter rates](#encounter-rates)
    - [Game Corner](#game-corner)
    - [Music](#music)
    - [Vanilla bugfixes](#vanilla-bugfixes)
- [New content](#new-content)
    - [New features](#new-features-that-were-not-in-the-vanilla-games)
    - [New NPCs and signs](#new-npcs-and-signs)
    - [Restored cut content](#cut-content-that-has-been-restored)

## Justifications
Why is it called Solus?
> The definition of 'solus' is something like: 'By oneself; alone. Used as a stage direction to a male character.'
> I think it complements the philosophy of the romhack, in that it highlights the 'solo' aspect of the game. The game is meant to be
> played by yourself (without relying on friends to trade) and all elements of the game are accessible in one ROM, i.e., 
> you don't need to rely on multiple versions to accomplish anything. The 'stage direction' bit is also relevant; the Pokémon games can sort of
> be thought of like a play, I guess. The fact that 'solus' is usually used for male characters is a bonus, since the 
> protagonist of Red/Blue is a young boy.

How did you decide where to put previously unobtainable Pokémon?
> If a Pokémon was version-exclusive, then its appearance was simply merged with the opposite game's counterpart Pokémon (Oddish vs. Bellsprout, for example, now both appear in the same locations where you'd previously only find one). For the cases where it wasn't this simple, you can find the justification for each decision in the table below. Some Pokémon were added to the wild if their previous acquisition method was only in the Game Corner, or only via trade, or if only one existed and multiple are needed for Dex completion (like Eevee).

Pokémon | Justification for location decision
--- | ---
Farfetch'd | added to Routes 12 and 13 @ 5% (like in Yellow)
Lickitung | added to Safari Zone (West) @ 1% (like JPN Blue)
Mr. Mime | added Route 21 @ 5% (like in Gen 2)
Hitmon[chan/lee] | added Hitmonchan to Victory Road 2F and Hitmonlee to Victory Road 3F (similar to LGPE) 
Bulbasaur | added to Viridian Forest @ 1% (similar to LGPE)
Squirtle | added to Seafoam Islands B3F and B4F @ 1% (similar to LGPE) because those 2 maps are the ones with water
Charmander | added to both floors of Rock Tunnel @ 1% (similar to LGPE)
Fossils (Dome/Helix) | added 2 additional fossils in Victory Road because it's late enough in the game that you wouldn't be able to use them for your main party
Eevee | added to Route 17 @ 5% (similar to LGPE)
Porygon | added a scientist who works for Pokémon Lab on Cinnabar Island who sells you one for 10,000p "illegally" (this is where Porygon was created originally); The price was determined because it's _around_ 10% (a bit less) of the Game Corner cost after doing coin conversion if you use the 6500c price (6,500 coins @ 1,000p per 50c = 130,000p x 10% = 13,000p).
Mew | added a static encounter in a new room of Cinnabar Lab basement (technically B2F); The thematic reasoning is a bit ambiguous... it could be interpreted as Mew "coming back" to the building where its DNA was used to create Mewtwo, in order to find Mewtwo... or it could be seen as the "original" Mew that was used for experimentation (whether Mew was ever present in this building or if DNA was taken from the jungle is not clear in the lore) now hiding somewhere in this building. The new room's entrance is surrounded by rocks as if a hole was broken in the floor by Mew.

Why did you think it was OK to change the Game Corner prize window Pokémon?
> Since all version-exclusive Pokémon appearances in the game were merged, I also removed the version-exclusives in the Game Corner. Their locations
> between both prize windows were swapped around a bit, and now the second window is identical to the one in Gold/Silver's Celadon Game Corner. I 
> thought this made sense thematically. Additionally, if a Pokémon appears in either prize window, its level/price are consistent with another
> occurrence of that same Pokémon in another game's prize window.
> 
> I also view obtaining Pokémon at the Game Corner as kind of an "extra" method (aside from Porygon in the original games). For that reason, I didn't think changing the layout of the prize windows was too detrimental to the Game Corner's role.

Why did you change the battle sprites?
> I think the "best" battle sprite for some of the original 151 Pokémon exist in the other Gen 1 releases. For this reason, I looked at each sprite (from Red/Blue, Yellow, or JPN Red/Green) and chose my favorite sprite for each Pokémon. Those picks are the ones I decided to use for SolusRGB. So yes, this was subjective. If you disagree with some of the choices, feel free to clone the repo and change them for yourself. :)

## Changes and fixes
### Palette
- Solus Green's palette on GBC hardware (or an emulator running in GBC mode) matches that of the original Japanese release for Green (green overworld, red sprites).
- Green Version-specific border and palette were restored for Super Game Boy for Solus Green, to match those of the original Japanese release for Green.
- Green Version-specific palette for the Game Corner slots were restored for Solus Green.

### Title screen
- The "Red Version"/"Green Version"/"Blue Version" text on the title screens has been changed to reflect the name of the romhack. The "Version" text has been removed from each, and "Solus" has been added to the beginning. They now read "Solus Red"/"Solus Green"/"Solus Blue". 
- The title screen Pokémon carousel for Solus Red, Solus Green, and Solus Blue have all been changed so that the Pokémon that are cycled through match those of the original Japanese releases for Red/Green/Blue (carousel variants [here][titlecarousels]).

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

### Encounter rates
- 10 to 12
- merge version diffs

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
- The Elite Four now all use the Gym Leader battle theme instead of using the default battle theme for the first three members (Lorelei, Bruno, Agatha).

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
- TODO: explain field move slots
- TODO: trader house
- porygon salesman
- mew room
### New NPCs and signs
- Pewter boy who hints at trader
- Trader sign ad
### Cut content that has been restored
- oak



[titlecarousels]: https://bulbapedia.bulbagarden.net/wiki/Game_intro#Pok%C3%A9mon_Red,_Green,_and_Blue
[spaceworld]: https://bulbapedia.bulbagarden.net/wiki/Pok%C3%A9mon_Gold_and_Silver_Spaceworld_%2797_demo