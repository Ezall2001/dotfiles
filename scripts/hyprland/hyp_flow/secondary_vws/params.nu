use ../../../sfzf [STYLED_FZF_DELIMETER build_action_header]

def get_header [] {
	let push_pull = {
		icon: '󰓡 ',
		label: 'push/pull'
		key: 'p'
	}

	let make_primary = {
		icon: '󰡗 ',
		label: 'make_primary'
		key: 'm'
	}


	let components = [$push_pull $make_primary]
	build_action_header $components
}

export def get_params [] {
	{
		nth: '3,2'
		with-nth: $'{1}($STYLED_FZF_DELIMETER){2}($STYLED_FZF_DELIMETER){3}'
		accept-nth: '{4}'
		header-label: actions
		header: (get_header)
		input-border: none
		header-border: horizontal
		no-separator: false
	}
}
