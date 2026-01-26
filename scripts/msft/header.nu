use ../sfzf [get_state get_toggle_icon build_action_header]

def get_sort_component [state:record] {
	let timestamp_key = if $state.sort == timestamp {'[i=timestamp]'} else {'i=timestamp'}
	let size_key = if $state.sort == size {'[z=size]'} else {'z=size'}
	let score_key = if $state.sort == score {'[o=score]'} else {'o=score'}


	let sort_key = if $state.group {$'($timestamp_key),($size_key)'} else {$'($score_key),($timestamp_key),($size_key)'}
	let sort_icon = if ($state.sort_direction == -1) {' '} else {' '}

	{
		icon: $sort_icon,
		label: sort,
		key: $sort_key
	}
}

def get_components [state:record] {
	let group = {
		icon: (get_toggle_icon $state.group),
		label: group,
		key: u
	}

	let delete = {
		icon: '󰗨 ',
		label: delete,
		key: x
	}

	let restore = {
		icon: '󰙰 ',
		label: 'restore',
		key: r
	}

	let restore_cwd = {
		icon: '󰙰 ',
		label: 'restore_cwd',
		key: w
	}

	let sort = get_sort_component $state

	[$group $sort $delete $restore $restore_cwd]
}

export def get_header [state?:record] {
	let state = $state | default (get_state)
	let components = get_components $state
	build_action_header $components
}
