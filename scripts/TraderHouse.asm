TraderHouse_Script:
	jp EnableAutoTextBoxDrawing

TraderHouse_TextPointers:
    def_text_pointers
    dw_const CeladonTraderText,		 	 TEXT_CELADON_TRADER

CeladonTraderText:
	text_asm
	ld a, TRADE_WITH_SELF
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd