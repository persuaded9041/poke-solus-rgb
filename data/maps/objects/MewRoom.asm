    object_const_def
	const_export MEWROOM_MEW

MewRoom_Object:
	db $7d ; border block

	def_warp_events
	warp_event  3,  5, LAST_MAP, 2

	def_bg_events

	def_object_events
	object_event 2, 2, SPRITE_MONSTER, STAY, DOWN, TEXT_MEWROOM_MEW, MEW, 30

	def_warps_to MEW_ROOM