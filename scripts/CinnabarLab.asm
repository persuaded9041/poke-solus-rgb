CinnabarLab_Script:
	call EnableAutoTextBoxDrawing
	ret

CinnabarLab_TextPointers:
	def_text_pointers
	dw_const CinnabarLabFishingGuruText,     TEXT_CINNABARLAB_FISHING_GURU
	dw_const CinnabarLabPorygonSalesmanText, TEXT_CINNABARLAB_PORYGON_SALESMAN ; dereknote - this needs to come after fishing guru (final object event) and before photo event (first bg event)
	dw_const CinnabarLabPhotoText,           TEXT_CINNABARLAB_PHOTO
	dw_const CinnabarLabMeetingRoomSignText, TEXT_CINNABARLAB_MEETING_ROOM_SIGN
	dw_const CinnabarLabRAndDSignText,       TEXT_CINNABARLAB_R_AND_D_SIGN
	dw_const CinnabarLabTestingRoomSignText, TEXT_CINNABARLAB_TESTING_ROOM_SIGN

CinnabarLabFishingGuruText:
	text_far _CinnabarLabFishingGuruText
	text_end

CinnabarLabPorygonSalesmanText:
	text_asm
	CheckEvent EVENT_BOUGHT_PORYGON, 1
	jp c, .alreadyBoughtPorygon
	ld hl, .IGotADealText
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem] ;dereknote - a is 0 if YES selected, 1 if NO
	and a ;dereknote - check if a is 0 or nonzero
	jp nz, .choseNo ;dereknote - jump to choseNo if a is not 0
	ldh [hMoney + 2], a ;dereknote - load a (0 from YES selection) into hram address [hMoney + 2], which is the third BCD byte 
	ldh [hMoney + 1], a ;dereknote - same for 2nd BCD byte
	ld a, $01 ;dereknote - now load hex $01 into the first BCD byte, to get pokedollar amount 10000 ($01 $00 $00) 
	ldh [hMoney], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, PORYGON, 20
	call GivePokemon
	jr nc, .done
	xor a
	ld [wPriceTemp + 2], a ;dereknote - do the same thing as above here
	ld [wPriceTemp + 1], a ;dereknote - and here
	ld a, $01 ;dereknote - and here
	ld [wPriceTemp], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	SetEvent EVENT_BOUGHT_PORYGON
	jr .done
.choseNo
	ld hl, .NoText
	jr .printText
.alreadyBoughtPorygon
	ld hl, .NoRefundsText
.printText
	call PrintText
.done
	jp TextScriptEnd

.IGotADealText
	text_far _CinnabarLabPorygonSalesmanIGotADealText
	text_end

.NoText
	text_far _CinnabarLabPorygonSalesmanNoText
	text_end

.NoMoneyText
	text_far _CinnabarLabPorygonSalesmanNoMoneyText
	text_end

.NoRefundsText
	text_far _CinnabarLabPorygonSalesmanNoRefundsText
	text_end

CinnabarLabPhotoText:
	text_far _CinnabarLabPhotoText
	text_end

CinnabarLabMeetingRoomSignText:
	text_far _CinnabarLabMeetingRoomSignText
	text_end

CinnabarLabRAndDSignText:
	text_far _CinnabarLabRAndDSignText
	text_end

CinnabarLabTestingRoomSignText:
	text_far _CinnabarLabTestingRoomSignText
	text_end
