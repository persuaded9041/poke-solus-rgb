LearnMove:
	call SaveScreenTilesToBuffer1
	ld a, [wWhichPokemon]
	ld hl, wPartyMonNicks
	call GetPartyMonName
	ld hl, wcd6d
	ld de, wLearnMoveMonName
	ld bc, NAME_LENGTH
	call CopyData

DontAbandonLearning:
	ld hl, wPartyMon1Moves
	ld bc, wPartyMon2Moves - wPartyMon1Moves
	ld a, [wWhichPokemon]
	call AddNTimes
		
	;dereknote - for field move slot
	jp LearnToFieldSlot
.back

	ld d, h
	ld e, l
	ld b, NUM_MOVES
.findEmptyMoveSlotLoop
	ld a, [hl]
	and a
	jr z, .next
	inc hl
	dec b
	jr nz, .findEmptyMoveSlotLoop
	push de
	call TryingToLearn
	pop de
	jp c, AbandonLearning
	push hl
	push de
	ld [wd11e], a
	call GetMoveName
	ld hl, OneTwoAndText
	call PrintText
	pop de
	pop hl
.next
	ld a, [wMoveNum]
	ld [hl], a
	ld bc, wPartyMon1PP - wPartyMon1Moves
	add hl, bc
	push hl
	push de
	dec a
	ld hl, Moves
	ld bc, MOVE_LENGTH
	call AddNTimes
	ld de, wBuffer
	ld a, BANK(Moves)
	call FarCopyData
	ld a, [wBuffer + 5] ; a = move's max PP
	pop de
	pop hl
	ld [hl], a
	ld a, [wIsInBattle]
	and a
	jp z, PrintLearnedMove
	ld a, [wWhichPokemon]
	ld b, a
	ld a, [wPlayerMonNumber]
	cp b
	jp nz, PrintLearnedMove
	ld h, d
	ld l, e
	ld de, wBattleMonMoves
	ld bc, NUM_MOVES
	call CopyData
	ld bc, wPartyMon1PP - wPartyMon1OTID
	add hl, bc
	ld de, wBattleMonPP
	ld bc, NUM_MOVES
	call CopyData
	jp PrintLearnedMove

AbandonLearning:
	ld hl, AbandonLearningText
	call PrintText
	call LearnMoveYesNo
	ld a, [wCurrentMenuItem]
	and a
	jp nz, DontAbandonLearning
	ld hl, DidNotLearnText
	call PrintText
	ld b, 0
	ret

PrintLearnedMove:
	ld hl, LearnedMove1Text
	call PrintText
	ld b, 1
	ret
PrintLearnedFieldMove:
	ld hl, LearnedMove1Text
	call PrintText
	ld bc, $0101	;make c=1 to indicate the move was learned as a field move
	ret

TryingToLearn:
	push hl
	ld hl, TryingToLearnText
	call PrintText
	call LearnMoveYesNo
	pop hl
	ld a, [wCurrentMenuItem]
	rra
	ret c
	ld bc, -NUM_MOVES
	add hl, bc
	push hl
	ld de, wMoves
	ld bc, NUM_MOVES
	call CopyData
	callfar FormatMovesString
	pop hl
.loop
	push hl
	ld hl, WhichMoveToForgetText
	call PrintText
	hlcoord 4, 7
	ld b, 4
	ld c, 14
	call TextBoxBorder
	hlcoord 6, 8
	ld de, wMovesString
	ldh a, [hUILayoutFlags]
	set 2, a
	ldh [hUILayoutFlags], a
	call PlaceString
	ldh a, [hUILayoutFlags]
	res 2, a
	ldh [hUILayoutFlags], a
	ld hl, wTopMenuItemY
	ld a, 8
	ld [hli], a ; wTopMenuItemY
	ld a, 5
	ld [hli], a ; wTopMenuItemX
	xor a
	ld [hli], a ; wCurrentMenuItem
	inc hl
	ld a, [wNumMovesMinusOne]
	ld [hli], a ; wMaxMenuItem
	ld a, A_BUTTON | B_BUTTON
	ld [hli], a ; wMenuWatchedKeys
	ld [hl], 0 ; wLastMenuItem
	ld hl, hUILayoutFlags
	set 1, [hl]
	call HandleMenuInput
	ld hl, hUILayoutFlags
	res 1, [hl]
	push af
	call LoadScreenTilesFromBuffer1
	pop af
	pop hl
	bit BIT_B_BUTTON, a
	jr nz, .cancel
	push hl
	ld a, [wCurrentMenuItem]
	ld c, a
	ld b, 0
	add hl, bc
	ld a, [hl]
	push af
	push bc
	call IsMoveHM
	pop bc
	pop de
	ld a, d
	jr c, .hm
	pop hl
	add hl, bc
	and a
	ret
.hm
	ld hl, HMCantDeleteText
	call PrintText
	pop hl
	jr .loop
.cancel
	scf
	ret

LearnedMove1Text:
	text_far _LearnedMove1Text
	sound_get_item_1 ; plays SFX_GET_ITEM_1 in the party menu (rare candy) and plays SFX_LEVEL_UP in battle
	text_promptbutton
	text_end

WhichMoveToForgetText:
	text_far _WhichMoveToForgetText
	text_end

AbandonLearningText:
	text_far _AbandonLearningText
	text_end

DidNotLearnText:
	text_far _DidNotLearnText
	text_end

TryingToLearnText:
	text_far _TryingToLearnText
	text_end

OneTwoAndText:
	text_far _OneTwoAndText
	text_pause
	text_asm
	ld a, SFX_SWAP
	call PlaySoundWaitForCurrent
	ld hl, PoofText
	ret

PoofText:
	text_far _PoofText
	text_pause
ForgotAndText:
	text_far _ForgotAndText
	text_end

HMCantDeleteText:
	text_far _HMCantDeleteText
	text_end

;defining this which replaces 2 instances of the same instructions earlier in this file
LearnMoveYesNo:
	coord hl, 14, 7
	lb bc, 8, 15
	ld a, TWO_OPTION_MENU
	ld [wTextBoxID], a
	call DisplayTextBoxID ; yes/no menu
	ret

;dereknote - for field move slot
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
LearnToFieldSlot:
;return z flag if not executed
;return nz flag if field move slot was learned
	push hl
	
	ld a, [wIsInBattle]
	and a
	jr nz, .return_fail	;do not allow the learning of a temporary field move in battle
	
	call SetCarryIfFieldMove
	jr nc, .return_fail
	
	ld hl, LearnTempFieldMoveText
	call PrintText
	call LearnMoveYesNo
	ld a, [wCurrentMenuItem]
	rra
	jr c, .return_fail	;exit if No is chosen
	
	;move to the correct field move slot
	ld a, [wWhichPokemon]
	ld c, a
	ld b,0
	ld hl, wTempFieldMoveSLots
	add hl, bc
	
	;exit if a move is already in that slot
	ld a, [hl]
	and a
	jr z, .next
	ld hl, LearnTempFieldMoveTextDenied
	call PrintText
	jr .return_occupied
.next
	
	;fill the slot with the move
	ld a, [wMoveNum]
	ld [hl], a
	
.return_success
	xor a
	add 1
	pop hl
	jp PrintLearnedFieldMove
.return_fail
	xor a
	pop hl
	jp DontAbandonLearning.back
.return_occupied
	xor a
	pop hl
	jp AbandonLearning

LearnTempFieldMoveText:
	text_far _LearnTempFieldMoveText
	db "@"
LearnTempFieldMoveTextDenied:
	text_far _LearnTempFieldMoveTextDenied
	db "@"

SetCarryIfFieldMove:
	ld a, [wMoveNum]
	push hl
	push de
	push bc
	ld hl, FieldMoveList
	ld de, $0001
	call IsInArray
	pop bc
	pop de
	pop hl
	;carry is set if this is a field move
	ret
FieldMoveList:
	db	CUT
	db	FLY
	db	SURF
	db	STRENGTH
	db	FLASH
	db	DIG
	db	TELEPORT
	db	SOFTBOILED
	db	$FF 