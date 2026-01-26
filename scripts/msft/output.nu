use ../sfzf [get_state]
use const.nu [DELIMITER]


export def get_output [selected:string]: nothing -> string {
	let state = get_state

	if $state.group {
		$selected | str replace $DELIMITER "\n" |
	} else {
		$selected
	}
}
