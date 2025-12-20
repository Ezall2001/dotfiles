use ../../sfzf [get_state update_state reload_input join_actions change_header]
use ./params/header_param.nu [get_header]

export def dir [] {
	let state = get_state
	let state = update_state {dir: (not $state.dir)} $state

	let header = get_header $state

	join_actions [
		(change_header $header)
		(reload_input)
	]
}

export def hidden [] {
	let state = get_state
	let state = update_state {hidden: (not $state.hidden)} $state

	let header = get_header $state

	join_actions [
		(change_header $header)
		(reload_input)
	]
}

export def ignored [] {
	let state = get_state
	let state = update_state {ignored: (not $state.ignored)} $state

	let header = get_header $state

	join_actions [
		(change_header $header)
		(reload_input)
	]
}

export def start [start:string] {
	let state = get_state
	if $state.start == $start {return ''}

	let state = update_state {start: $start} $state

	let header = get_header $state

	join_actions [
		(change_header $header)
		(reload_input)
	]
}

export def absolute [] {
	let state = get_state
	let state = update_state {absolute: (not $state.absolute)} $state

	let header = get_header $state

	join_actions [
		(change_header $header)
	]
}
