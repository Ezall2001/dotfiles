use ../hyp_setups [get_state]
use ../hyp_utils [get_ws_name get_vws_attached_window]

export def main [row:int type:string] {
	let state = get_state
	let vws_window = get_vws_attached_window $row $type $state

	if $vws_window != null {
		hyprctl dispatch focuswindow address:($vws_window.address)
		return
	}

	let vws = if $type == primary {
		$state.primary_vws_list | get $row
	} else {
		$state.secondary_vws_list | where row == $row | first
	}

	let name = get_ws_name $vws.row $type
	hyprctl dispatch workspace name:($name)
}
