use ../sfzf [main FZF_DELIMETER update_state]
use params.nu [get_params]
use const.nu [DEFAULT_STATE INPUT_GETTER BINDS]
use input.nu [get_input]
use output.nu [get_output]

def get_default_state [group:bool] {
	let state = $DEFAULT_STATE | merge {group:$group}
	let cond_state = if $group {{sort: timestamp}} else {{}}
	$state | merge $cond_state
}

export def _msft [group:bool] {
	let state = get_default_state $group
	update_state $state {}
	let params = get_params $state

	let selected = get_input | sfzf $INPUT_GETTER --binds $BINDS --params $params
	get_output $selected
}

# returns selected as a nuon list
export def main [--group (-g)]: nothing -> string {
	_msft $group
}
