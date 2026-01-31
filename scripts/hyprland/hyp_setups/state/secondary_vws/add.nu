use ../../utils [get_state update_state]
use ../../get_setup.nu [main]
use ../../../hyp_utils [mon_to_col get_ws_name]

export def add_secondary_vws [col?:int] {
	let setup = get_setup
	let state = get_state

	let col = if $col == null {
		hyprctl activeworkspace -j | from json
		| get monitor | mon_to_col $in $setup
	} else {$col}

	let row = $state.secondary_vws_list | length

	let vws = {col:$col row:$row}
	let new_list = $state.secondary_vws_list | append $vws

	update_state {secondary_vws_list: $new_list} $state

	let ws_name = get_ws_name $vws.row secondary
	#TODO: create workspace
	$vws
}
