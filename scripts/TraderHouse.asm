TraderHouse_Script:
	jp EnableAutoTextBoxDrawing

TraderHouse_TextPointers:
    def_text_pointers
    dw_const CeladonTraderText,		TEXT_CELADON_TRADER
	dw_const TraderJournalText,     TEXT_CELADON_TRADER_JOURNAL

CeladonTraderText:
	text_asm
	ld a, TRADE_WITH_SELF
	ld [wWhichTrade], a
	predef DoInGameTradeDialogue
	jp TextScriptEnd

TraderJournalText:
	text_far _TraderJournalText
	text_end