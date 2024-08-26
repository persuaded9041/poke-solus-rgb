MewRoom_Script:
	call EnableAutoTextBoxDrawing
	ld hl, MewRoomTrainerHeaders
	ld de, MewRoom_ScriptPointers
	ld a, [wMewRoomCurScript]
	call ExecuteCurMapScriptInTable
	ld [wMewRoomCurScript], a
	ret

MewRoom_ScriptPointers:
	def_script_pointers
	dw_const CheckFightingMapTrainers,              SCRIPT_MEWROOM_DEFAULT
	dw_const DisplayEnemyTrainerTextAndStartBattle, SCRIPT_MEWROOM_START_BATTLE
	dw_const EndTrainerBattle,                      SCRIPT_MEWROOM_END_BATTLE

MewRoom_TextPointers:
	def_text_pointers
	dw_const MewRoomMewText, TEXT_MEWROOM_MEW

MewRoomTrainerHeaders:
	def_trainers
MewTrainerHeader:
	trainer EVENT_BEAT_MEW, 0, MewBattleText, MewBattleText, MewBattleText
	db -1 ; end

MewRoomMewText:
	text_asm
	ld hl, MewTrainerHeader
	call TalkToTrainer
	jp TextScriptEnd

MewBattleText:
	text_far _MewtwoBattleText ;dereknote - using the same battle text as Mewtwo
	text_asm
	ld a, MEW
	call PlayCry
	call WaitForSoundToFinish
	jp TextScriptEnd