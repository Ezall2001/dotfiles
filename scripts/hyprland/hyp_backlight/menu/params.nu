use ../../../sfzf [STYLED_FZF_DELIMETER build_action_header]

def get_header [] {
	let set = {
		icon: ' ',
		label: 'set',
		key: 'num'
	}

	let black = {
		icon: '⚫',
		label: 'eclipse'
		key: 'b'
	}

	let components = [$set $black]
	build_action_header $components
}

export def get_params [] {
	{
		nth: '1,2'
		with-nth: $'{1}($STYLED_FZF_DELIMETER){2}($STYLED_FZF_DELIMETER){3}'
		header-label: actions
		header: (get_header)
		input-border: none
		header-border: horizontal
		no-separator: false
	}
}
