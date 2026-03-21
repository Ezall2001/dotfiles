use ../../../sfzf [get_state update_state reload_input join_actions change_header]
use header.nu [get_header]

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

export def pause [lvl:int] {
	dunstctl set-pause-level $lvl

	let state = update_state {pause: $lvl}
	let header = get_header $state

	join_actions [
		(change_header $header)
	]
}
