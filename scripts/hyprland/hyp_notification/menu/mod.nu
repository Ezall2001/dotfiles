use ./consts.nu [INPUT_GETTER BINDS]
use ../../../sfzf [main STYLED_FZF_DELIMETER update_state]
use header.nu [get_header]
use params.nu [get_params]
use input.nu [get_input]
use ../pause.nu [get_current_defined_lvl]

def default_state [] {
	{
		pause: (get_current_defined_lvl)
	}
}

export def _menu [] {
	let state = default_state
	update_state $state {}

	let params = get_params $state
	get_input | sfzf --params $params --binds $BINDS $INPUT_GETTER
}
