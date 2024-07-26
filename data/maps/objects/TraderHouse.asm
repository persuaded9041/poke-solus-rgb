    object_const_def
	const_export CELADON_TRADER

TraderHouse_Object:
	db $a ; border block

	def_warp_events
	warp_event  2, 7, LAST_MAP, 14
    warp_event  3, 7, LAST_MAP, 14

	def_bg_events

	def_object_events
    object_event  5, 3, SPRITE_FISHER, STAY, 0, TEXT_CELADON_TRADER

	def_warps_to TRADER_HOUSE