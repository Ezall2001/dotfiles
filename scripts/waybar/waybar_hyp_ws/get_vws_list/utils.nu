use ../../../hyprland/hyp_utils [get_vws_attached_window]

export def has_own_window [vws:record state:record col:int] {
	let vws_win = get_vws_attached_window $vws.row $vws.type $state
	if $vws_win == null { return false }

	let ws_name = get_ws_name $vws.row $vws.type

	let attached_win = hyprctl clients -j | from json
	| where ($it.address == $vws_win.address) and ($it.workspace.name == $ws_name) | first

	$attached_win != null
}

export def has_foreign [vws:record col:int has_own:bool] {
	let ws_name = get_ws_name $vws.row $vws.type
	let expected = if $has_own {1} else {0}

	hyprctl clients -j | from json
	| where ($it.workspace.name == $ws_name)
	| length | $in > $expected
}

export def is_active [vws:record active_vws:oneof<record,nothing>] {
	if $active_vws == null {
		false
	} else {
		$vws.row == $active_vws.row and $vws.col == $active_vws.col and $vws.type == $active_vws.type
	}
}

export def is_focused [vws:record focused_vws:oneof<record,nothing>] {
	if $focused_vws == null {
		false
	} else {
		$vws.row == $focused_vws.row and $vws.type == $focused_vws.type
	}
}
