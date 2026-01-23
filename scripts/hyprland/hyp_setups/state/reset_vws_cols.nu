use ../get_setup.nu [main]
use ../utils [get_state update_state]
use ../../hyp_utils [col_to_mon get_ws_name]

def reset_primary_vws [setup_vws:record] {
	let col = do $setup_vws.col_rule
	{row:$setup_vws.row col:$col}
}

def get_mon_availability [setup:record] {
	let mons = hyprctl monitors -j | from json

	$setup.monitors | insert available {|row|
		$row.name in $mons.name
	}
}

def get_next_available_col [col:int mons_availability:table] {
	mut col = $col
	let mons_len = $mons_availability | length

	loop {
		if $col >= $mons_len {
			notify-send -u CRITICAL -t 5000 "couldn't find a col (you idiot)"
			return 0
		}

		let mon = $mons_availability | where col == $col | first
		if $mon == null or $mon.available == false {
			$col = $col + 1
			continue
		}

		return $col
	}
}

def move_ws [old_vws:record new_vws:record type:string setup:record] {
	if $old_vws.col == $new_vws.col {return}

	let ws_name = get_ws_name $new_vws.row $type
	let mon_name = col_to_mon $new_vws.col $setup
	hyprctl dispatch moveworkspacetomonitor name:($ws_name) $mon_name
}

export def main [] {
	let state = get_state
	let setup = get_setup

	let mons_availability = get_mon_availability $setup

	let primary_vws_list = $setup.primary_vws_list
	| each {|vws| reset_primary_vws $vws}

	let secondary_vws_list = $state.secondary_vws_list
	| update col {|vws| get_next_available_col $vws.col $mons_availability}


	let update = {
		primary_vws_list: $primary_vws_list
		secondary_vws_list: $secondary_vws_list
	}

	let new_state = update_state $update $state

	$state.primary_vws_list | zip $primary_vws_list
	| each {|pair|
		move_ws $pair.0 $pair.1 primary $setup
	}

	$state.secondary_vws_list | zip $secondary_vws_list
	| each {|pair|
		move_ws $pair.0 $pair.1 secondary $setup
	}

	$new_state
}
