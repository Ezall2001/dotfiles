use ../hyp_setups [get_setup]
use ../hyp_utils [get_first_availble_mon get_mons_availability]

export def main [] {
	let setup = get_setup
	let main_mon = get_first_availble_mon $setup

	let mons = get_mons_availability $setup
	$mons | where name != $main_mon.name and available == true
	| each {|mon|
		hyprctl dispatch dpms off ($mon.name)
	}

	hyprlock
}
