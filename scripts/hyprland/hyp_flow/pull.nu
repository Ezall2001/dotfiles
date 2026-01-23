use ../hyp_utils [get_vws_attached_window get_active_ws get_ws_name]
use ../hyp_setups [get_state get_setup]

export def main [row:int type:string] {
	let state = get_state
	let setup = get_setup

	let win = get_vws_attached_window $row $type $state

	if $win == null {return}

	let active_ws = get_active_ws $setup
	let ws_name = get_ws_name $active_ws.row $active_ws.type

	hyprctl dispatch movetoworkspace name:($ws_name), address:($win.address)
}
