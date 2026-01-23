use ../hyp_setups [get_state]
use ../hyp_utils [get_ws_name]

def get_active_addr [] {
	let active = hyprctl activewindow -j | from json
	if $active == null {null} else $active.address
}

export def main [addr?:string] {
	let state = get_state

	let addr = $addr | (default (get_active_addr))
	if $addr == null {return}

	let win = $state.windows | where address == $addr | first
	if $win == null or $win.attached == null { return }

	let ws_name = get_ws_name $win.attached.row $win.attached.type
	hyprctl dispatch movetoworkspacesilent name:($ws_name), address:($addr)
}
