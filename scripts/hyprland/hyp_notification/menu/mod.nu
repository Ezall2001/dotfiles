use ./consts.nu [INPUT_GETTER]
use ../../../sfzf [main STYLED_FZF_DELIMETER update_state]
use header.nu [get_header]
use binds.nu [get_binds]
use params.nu [get_params]
use input.nu [get_input]

def default_state [] {
	{
		pause: (dunstctl get-pause-level)
	}
}

export def _menu [] {
	let state = default_state
	update_state $state {}

	let params = get_params $state
	let binds = get_binds
	get_input | sfzf --params $params --binds $binds $INPUT_GETTER
}
