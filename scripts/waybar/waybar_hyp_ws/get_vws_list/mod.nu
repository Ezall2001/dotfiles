use ../../../hyprland/hyp_setups [get_setup get_state]
use ../../../hyprland/hyp_utils [get_focused_ws get_active_ws]
use ./derive_vws.nu [main]


export def main [col:int] {
	let state = get_state
	let setup = get_setup
	let focused_ws = get_focused_ws $col $setup
	let active_ws = get_active_ws $setup

	let primary_vws_list = $state.primary_vws_list | each {$in | merge {type: primary}}
	let secondary_vws_list = $state.secondary_vws_list | each {$in | merge {type: secondary}}

	($primary_vws_list ++ $secondary_vws_list)
	| each {|vws| derive_vws $col $state $vws $focused_ws $active_ws }
}
