use ../../hyp_setups
use ../../hyp_apps
use ../../../waybar/waybar_hyp_ws


export def window_opened_handler [addr:string] {
	let addr = $'0x($addr)'

	hyp_apps apply_tags $addr
	hyp_setups add_window $addr
	waybar_hyp_ws refresh
}

export def window_closed_handler [addr:string] {
	let addr = $'0x($addr)'

	hyp_setups remove_window $addr
	waybar_hyp_ws refresh
}

export def move_window_handler [addr:string ws_name:string] {
	waybar_hyp_ws refresh
}

export def active_window_change_handler [addr:string] {
	waybar_hyp_ws refresh
}
