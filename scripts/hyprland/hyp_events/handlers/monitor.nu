use ../../hyp_setups [reset_vws_cols]
use ../../../waybar/waybar_hyp_ws

export def monintor_added_handler [name:string] {
	reset_vws_cols
	waybar_hyp_ws refresh
}

export def monintor_removed_handler [name:string] {
	reset_vws_cols
	waybar_hyp_ws refresh
}
