FuchsiaBillsGrandpasHouse_Script:
	call EnableAutoTextBoxDrawing
	ret

FuchsiaBillsGrandpasHouse_TextPointers:
	def_text_pointers
	dw_const FuchsiaBillsGrandpasHouseMiddleAgedWomanText, TEXT_FUCHSIABILLSGRANDPASHOUSE_MIDDLE_AGED_WOMAN
	dw_const FuchsiaBillsGrandpasHouseBillsGrandpaText,    TEXT_FUCHSIABILLSGRANDPASHOUSE_BILLS_GRANDPA
	dw_const FuchsiaBillsGrandpasHouseYoungsterText,       TEXT_FUCHSIABILLSGRANDPASHOUSE_YOUNGSTER
	dw_const FuchsiaBillsGrandpasHouseBillsFatherText,     TEXT_FUCHSIABILLSGRANDPASHOUSE_BILLS_FATHER ; dereknote - this needs to come after final object event in objects file (youngster above)

FuchsiaBillsGrandpasHouseMiddleAgedWomanText:
	text_far _FuchsiaBillsGrandpasHouseMiddleAgedWomanText
	text_end

FuchsiaBillsGrandpasHouseBillsGrandpaText:
	text_far _FuchsiaBillsGrandpasHouseBillsGrandpaText
	text_end

FuchsiaBillsGrandpasHouseYoungsterText:
	text_far _FuchsiaBillsGrandpasHouseYoungsterText
	text_end

; new event for TM51 FLAMETHROWER sale from Bill's father
FuchsiaBillsGrandpasHouseBillsFatherText:
	text_asm
	CheckEvent EVENT_BOUGHT_TM51, 1
	jp c, .alreadyBoughtFlamethrower
	ld hl, .IGotADealText
	call PrintText
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	call YesNoChoice
	ld a, [wCurrentMenuItem] ;dereknote - a is 0 if YES selected, 1 if NO
	and a ;dereknote - check if a is 0 or nonzero
	jp nz, .choseNo ;dereknote - jump to choseNo if a is not 0
	ldh [hMoney], a ;dereknote - load a (0 from YES selection) into hram address [hMoney], which is the first BCD byte 
	ldh [hMoney + 2], a ;dereknote - same for 3rd BCD byte
	ld a, $80 ;dereknote - now load hex $80 into the second BCD byte, to get pokedollar amount 100 ($00 $80 $00) 
	ldh [hMoney + 1], a
	call HasEnoughMoney
	jr nc, .enoughMoney
	ld hl, .NoMoneyText
	jr .printText
.enoughMoney
	lb bc, TM_FLAMETHROWER, 1
	call GiveItem
	jr nc, .bag_full ; dereknote - if GiveItem fails (full bag), go to bag_full
	ld hl, .ReceivedFlamethrowerText
	call PrintText
	SetEvent EVENT_BOUGHT_TM51
	
	;jr nc, .done

	; money subtraction part
	xor a
	ld [wPriceTemp], a ;dereknote - do the same thing as above here
	ld [wPriceTemp + 2], a ;dereknote - and here
	ld a, $80 ;dereknote - and here
	ld [wPriceTemp + 1], a
	ld hl, wPriceTemp + 2
	ld de, wPlayerMoney + 2
	ld c, $3
	predef SubBCDPredef
	ld a, MONEY_BOX
	ld [wTextBoxID], a
	call DisplayTextBoxID
	; end money subtraction part

	jr .done
	
.choseNo
	ld hl, .NoText
	jr .printText
.bag_full
	ld hl, .FlamethrowerNoRoomText
	call PrintText
	jr .done
.alreadyBoughtFlamethrower
	ld hl, .FollowupText
.printText
	call PrintText
.done
	jp TextScriptEnd
.IGotADealText
	text_far _FuchsiaBillsGrandpasHouseBillsFatherIGotADealText
	text_end
.NoText
	text_far _FuchsiaBillsGrandpasHouseBillsFatherNoText
	text_end
.NoMoneyText
	text_far _FuchsiaBillsGrandpasHouseBillsFatherNoMoneyText
	text_end
.ReceivedFlamethrowerText:
	text_far _FuchsiaBillsGrandpasHouseBillsFatherReceivedFlamethrowerText
	sound_get_item_1
	text_far _FuchsiaBillsGrandpasHouseBillsFatherFlamethrowerExplanationText
	text_end
.FlamethrowerNoRoomText:
	text_far _FuchsiaBillsGrandpasHouseBillsFatherFlamethrowerNoRoomText
	text_end
.FollowupText
	text_far _FuchsiaBillsGrandpasHouseBillsFatherFollowupText
	text_end
