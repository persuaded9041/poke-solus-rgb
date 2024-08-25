    object_const_def
	const_export FOSSIL_ROOM_HELIX_FOSSIL
	const_export FOSSIL_ROOM_DOME_FOSSIL

FossilRoom_Object:
	db $7d ; border block, same as Victory Road's

	def_warp_events
	warp_event  1, 9, LAST_MAP, 4 ; fourth warp on previous map

	def_bg_events

	def_object_events
    object_event 2, 3, SPRITE_FOSSIL, STAY, NONE, TEXT_FOSSIL_ROOM_HELIX_FOSSIL, HELIX_FOSSIL
    object_event 3, 3, SPRITE_FOSSIL, STAY, NONE, TEXT_FOSSIL_ROOM_DOME_FOSSIL, DOME_FOSSIL

	def_warps_to FOSSIL_ROOM