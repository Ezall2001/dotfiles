use ../../hyp_utils [get_active_ws]
use ../../hyp_setups
use ../push.nu [main]

def pull_win [addr:string ws:string] {
	hyprctl dispatch movetoworkspacesilent name:($ws), address:($addr)
}

export def make_primary_vws [addr:string] {

	let active_ws = hyprctl activeworkspace -j | from json | get name

	let data = hyp_setups make_primary_window $addr
	if $data == null {return}

	push $data.prv_win.address
	push $data.new_win.address
}

export def push_pull [addr:string] {
	let setup = hyp_setups get_setup

	let active_ws = get_active_ws $setup
	if $active_ws == null {return ''}

	let client = hyprctl clients -j | from json
	| where address == $addr | first
	if $client == null {return ''}

	let active_ws = hyprctl activeworkspace -j | from json | get name

	if $active_ws == $client.workspace.name {
		push $addr
	} else {
		pull_win $addr $active_ws
	}

}

export def focus [addr:string] {
	hyprctl dispatch focuswindow address:($addr)
}
