use consts.nu [INPUT_GETTER DEFAULT_STATE]
use params.nu [get_params]
use binds.nu [get_binds]
use ../../sfzf [main update_state]

export use input.nu [get_input]
export use preview.nu [main]
export use actions.nu [yank]
export use events.nu [on_focus_change]

export def main [] {
	let state = $DEFAULT_STATE
	update_state $state {}
	let params = get_params $state
	let binds = get_binds

	get_input $state
	| sfzf $INPUT_GETTER --binds $binds --params $params
}
