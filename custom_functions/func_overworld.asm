;Check if any pokemon in the party has a certain move
;move ID should be in 'c'
;set zero flag if move not found
;clear zero flag if move found
;if move found, return party position in A (zero offset)
PartyMoveTest:
	ld a, [wPartyCount]
	and a
	ret z	;treat as not finding a move is the party count is 0
	
	push de
	push hl
	push bc
	ld b, a	;B will track the loops for party members
.loop	
	ld a, b
	dec a
	ld d, a
	ld hl, wPartyMon1Moves
	push bc
	ld bc, wPartyMon2Moves - wPartyMon1Moves
	call AddNTimes
	pop bc
	
	push bc
	ld b, NUM_MOVES
.loop2
	ld a, [hli]
	cp c
	jr z, .loop2exit
	dec b
	jr nz, .loop2
	
	;check temp field move slot if not found in move list
	push bc
	push hl
	ld b, 0
	ld c, d
	ld hl, wTempFieldMoveSLots
	add hl, bc
	ld a, [hl]
	pop hl
	pop bc
	
.loop2exit
	cp c
	pop bc
	ld a, d
	jr z, .return_nz

	dec b
	jr nz, .loop
	jr .return
.return_nz
	ld b, 0
	inc b
.return
	pop bc
	pop hl
	pop de
	ret