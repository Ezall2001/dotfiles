use ../../../sfzf [get_state get_toggle_icon build_action_header]
use ../consts.nu [STARTS]

def get_filters [state:record] {
	let hidden = {
		icon: (get_toggle_icon $state.hidden),
		label: hidden,
		key: h
	}

	let ignored = {
		icon: (get_toggle_icon $state.ignored),
		label: ignored,
		key: i
	}

	let dir = {
		icon: (get_toggle_icon $state.dir),
		label: dir,
		key: d
	}

	let absolute = {
		icon: (get_toggle_icon $state.absolute),
		label: abs,
		key: a
	}

	let start = {
		icon:' ',
		label:$state.start,
		key:'m=home,e=personal,r=root'
	}

	[$hidden $ignored $dir $absolute $start]
}

export def get_header [state?:record] {
	let state = $state | default (get_state)
	let components = get_filters $state
	build_action_header $components
}
