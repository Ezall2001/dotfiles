use ../consts.nu [HYP_SETUP_STATE_FILE]
use ../../hyp_utils [get_ws_name col_to_mon]
use ../../hyp_utils/ws [get_ws_name]

def init_vws [vws:record setup:record] {
	let ws_name = get_ws_name $vws.row primary
	let mon_name = col_to_mon $vws.col $setup

	hyprctl keyword workspace name:($ws_name), persistent:true, monitor:($mon_name)
}

def create_state_vws [vws:record] {
	let col = do $vws.col_rule
	{row:$vws.row col:$col}
}

export def main [] {
	let setup = get_setup

	let vws_list = $setup.primary_vws_list
	| each {|vws|
		let state_vws = create_state_vws $vws
		init_vws $state_vws $setup
		$state_vws
	}

	let state = {
		primary_vws_list: $vws_list
		secondary_vws_list: []
		windows: []
	}

	$state | save -f $HYP_SETUP_STATE_FILE
}

#TODO: change_vws_window
