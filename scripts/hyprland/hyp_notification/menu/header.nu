use ../../../sfzf [get_state build_action_header]
use ../../../nushell/nui/ansi [style]

def get_components [state:record] {
	let unpause = {
		icon: ' '
		label: ''
		key: 'u'
	}

	let pause = {
		icon: ' '
		label: $"\(($state.pause))"
		key: 'num'
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


	[$delete $clear $pause $unpause]
}

export def get_header [state?:record] {
	let state = $state | default (get_state)
	let components = get_components $state
	build_action_header $components
}
