use ../../../sfzf [get_state update_state reload_input join_actions change_header]
use header.nu [get_header]
use ../pause.nu [main get_current_defined_lvl]
alias _pause = pause

export def clear [] {
	dunstctl history-clear

	join_actions [
		'close'
	]
}

export def delete [id:string] {
	dunstctl history-rm $id

	join_actions [
		(reload_input)
	]
}

export def pause [--increase --decrease] {
	_pause --increase=$increase --decrease=$decrease

	let state = update_state {pause: (get_current_defined_lvl)}
	let header = get_header $state

	join_actions [
		(change_header $header)
	]
}
