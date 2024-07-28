WildMonEncounterSlotChances:
; There are 12 slots for wild pokemon, and this is the table that defines how common each of
; those 12 slots is. A random number is generated and then the first byte of each pair in this
; table is compared against that random number. If the random number is less than or equal
; to the first byte, then that slot is chosen.  The second byte is double the slot number.
	db  50, $00 ; 51/256 = 19.9% chance of slot 0
	db 101, $02 ; 51/256 = 19.9% chance of slot 1
	db 126, $04 ; 25/256 =  9.8% chance of slot 2
	db 151, $06 ; 25/256 =  9.8% chance of slot 3
	db 176, $08 ; 25/256 =  9.8% chance of slot 4
	db 201, $0A ; 25/256 =  9.8% chance of slot 5
	db 214, $0C ; 13/256 =  5.1% chance of slot 6
	db 227, $0E ; 13/256 =  5.1% chance of slot 7
	db 238, $10 ; 11/256 =  4.3% chance of slot 8
	db 249, $12 ; 11/256 =  4.3% chance of slot 9
	db 252, $14 ;  3/256 =  1.2% chance of slot 10
	db 255, $16 ;  3/256 =  1.2% chance of slot 11
	; dereknote: two additional slots added (overall, increased 4.3% and 1.2% slots from 1 each to 2 each)


