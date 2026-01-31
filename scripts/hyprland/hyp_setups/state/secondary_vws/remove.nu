use ../../utils [get_state update_state]
use ../../../hyp_utils [get_ws_name]

def tmp_update_window [win:record row:int] {
	let win = if $win.attached == null or $win.attached.type == primary or $win.attached.row <= $row {
		$win
	} else {
		let new_row = $win.attached.row - 1
		let name = get_ws_name $new_row secondary
		hyprctl dispatch movetoworkspacesilent name:($name), address:($win.address)
		$win | update attached.row ($win.attached.row - 1)
	}

	$win
}

export def remove_secondary_vws [row:int] {
	let state = get_state

	let len = $state.secondary_vws_list | length
	let secondary_vws_list = $state.secondary_vws_list | take ($len - 1)
	let removed_vws = $state.secondary_vws_list | last

	let windows = $state.windows | each {tmp_update_window $in $row}

	update_state {
		secondary_vws_list: $secondary_vws_list
		windows: $windows
	} $state

	#TODO: destroy the workspaces
	$removed_vws
}
