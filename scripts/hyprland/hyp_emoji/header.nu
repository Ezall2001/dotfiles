use ../../sfzf [build_action_header]

export def get_header [] {
	let copy = {
		icon: '󰆏 ',
		label: 'copy',
		key: y
	}

	let components = [$copy]
	build_action_header $components
}
