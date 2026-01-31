use ../utils [get_state update_state]
use ../get_setup.nu [main]
use ./secondary_vws [remove_secondary_vws]
use ../../hyp_utils [get_ws_name col_to_mon]


export def main [new_col:int row:int type:string] {
	let state = get_state
	let setup = get_setup

	let list = if $type == primary {
		$state.primary_vws_list
	} else {
		$state.secondary_vws_list
	}

	let vws = $list | where row == $row | first
	if $vws.col == $new_col { return }

	let new_list = $list | update col {|item|
		if $item.row == $row {$new_col} else {$item.col}
	}

	let update = if $type == primary {
		{primary_vws_list:$new_list}
	} else {
		{secondary_vws_list:$new_list}
	}

	update_state $update $state

	let ws_name = get_ws_name $row $type
	let mon_name = col_to_mon $new_col $setup
	hyprctl dispatch moveworkspacetomonitor name:($ws_name) $mon_name

	$new_list | where row == $row | first
}
