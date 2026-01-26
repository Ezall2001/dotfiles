use ../sfzf [get_state update_state reload_input join_actions change_header]
use header.nu [get_header]
use const.nu [DELIMITER]

export def group [] {
	let state = get_state
	let state = update_state {group: (not $state.group)} $state

	let action = if $state.group {'msft --group'} else {'msft'}

	join_actions [
		$'become[($action)]'
	]
}

export def sort [by:string] {
	let state = get_state

	let direction = if $by == score {-1} else if $by == $state.sort { $state.sort_direction * -1 } else {-1}
	let state = update_state {sort: $by, sort_direction: $direction} $state

	let header = get_header $state

	join_actions [
		(change_header $header)
		'toggle-sort'
		(reload_input)
	]
}

export def delete [selected:list<string>] {
	let state = get_state

	let selected = if $state.group {
		$selected | each {split row $DELIMITER} | flatten
	} else { $selected }

	if not ($selected | is-empty) {
		gtrash rm -f ...$selected | ignore
	}

	join_actions [
		(reload_input)
	]

}

export def restore [selected:list<string> --cwd] {
	let state = get_state

	let selected = if $state.group {
		$selected | each {split row $DELIMITER} | flatten
	} else { $selected }

	if $cwd {
		gtrash restore -f ...$selected --restore-to $env.PWD | ignore
	} else {
		gtrash restore -f ...$selected | ignore
	}

	join_actions [
		(reload_input)
	]
}
