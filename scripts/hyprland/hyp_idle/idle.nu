use ../hyp_setups [get_setup]
use ../hyp_utils [get_first_availble_mon]

export def main [] {
	let setup = get_setup
	let mon = get_first_availble_mon $setup

	hyprctl dispatch dpms off ($mon.name)
}
