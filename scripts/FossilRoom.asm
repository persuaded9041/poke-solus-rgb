FossilRoom_Script:
	jp EnableAutoTextBoxDrawing

FossilRoom_TextPointers:
    def_text_pointers
    dw_const PickUpItemText,    TEXT_FOSSIL_ROOM_HELIX_FOSSIL ; need to add non-bg event text scripts before bg event text scripts (same order as the FossilRoom objects file; check the order there, although right now it has no bg events anyway)
    dw_const PickUpItemText,    TEXT_FOSSIL_ROOM_DOME_FOSSIL