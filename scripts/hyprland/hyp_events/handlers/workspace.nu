use ../../../waybar/waybar_hyp_ws

export def workspace_changed_handler [name:string] {
	waybar_hyp_ws refresh
}

export def move_workspace_handler [ws_name:string mon_name:string] {
	waybar_hyp_ws refresh
}
