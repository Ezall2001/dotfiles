use ../../../hyprland/hyp_utils [get_ws_name]
use ./utils.nu [has_foreign has_own_window is_active is_focused]

def not_focusable_derivitive [vws:record] {
	{
		has_foreign:false
		has_own:false
		is_focusable: false
		is_focused: false
	}
}

def focusable_derivitive [
	col:int
	state:record
	vws:record
	focused_vws:oneof<record,nothing>
	active_vws:oneof<record,nothing>
] {
	let has_own = has_own_window $vws $state $col
	let has_foreign = has_foreign $vws $col $has_own
	let is_focused = is_focused $vws $focused_vws
	let is_active = is_active $vws $active_vws

	{
		has_foreign: $has_foreign
		has_own: $has_own
		is_focusable: true
		is_focused: $is_focused
		is_active: $is_active
	}
}

export def main [
	col:int
	state:record
	vws:record
	focused_vws:oneof<record,nothing>
	active_vws:oneof<record,nothing>
] {
	let derivitive = if $vws.col != $col {
		not_focusable_derivitive $vws
	} else {
		focusable_derivitive $col $state $vws $focused_vws $active_vws
	}

	$vws | merge $derivitive
}
