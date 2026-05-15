use ../../../sfzf [get_state build_action_header]
use ../../../nushell/nui/ansi [style]

def get_components [state:record] {
	let pause = {
		icon: ' '
		label: $"($state.pause.label) \(($state.pause.val))"
		key: 'H/L'
	}

	let delete = {
		icon: '󰗨',
		label: '',
		key: x
	}

	let clear = {
		icon: '󰗨',
		label: '(all)',
		key: X
	}


	[$delete $clear $pause]
}

export def get_header [state?:record] {
	let state = $state | default (get_state)
	let components = get_components $state
	build_action_header $components
}
