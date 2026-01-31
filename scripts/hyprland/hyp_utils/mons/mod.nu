export def get_mons_availability [setup:record] {
	let active_mons = hyprctl monitors -j | from json
	$setup.monitors | insert available {|mon|
		$mon.name in $active_mons.name
	}
}

export def get_first_availble_mon [setup:record] {
	let mons = get_mons_availability $setup
	$mons | sort-by col | where available | first
}
