use ./preview.nu
use ./filters.nu
use ./consts.nu [BINDS INPUT_GETTER DEFAULT_STATE]
use ./params/mod.nu [get_params]
use ./input.nu [get_input]
use ./output.nu [get_output]
use ../../sfzf [main get_state update_state]
use ../nui [commandline]


export def _main [buffer:string, pos:int, state?:record] {
	let state = $DEFAULT_STATE | merge ($state | default {})
	update_state $state {}
	let cursor_str = commandline get $buffer $pos
	let params = get_params $state $cursor_str.string

	let selected = get_input
	| sfzf $INPUT_GETTER --binds $BINDS --params $params
	get_output $buffer $cursor_str $selected
}

export def main [buffer='':string, pos=0:int, state?:record] {
	_main $buffer $pos $state
}
