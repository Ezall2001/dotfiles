use consts.nu [DEFAULT_PARAMS]
use footer.nu [make_footer_params]
use binds.nu [make_binds_params]
use utils/state.nu [update_internal_state]
use header/make_header_params.nu
use ../nushell/nui/params

export use header/actions_header.nu *
export use consts.nu [FZF_DELIMETER STYLED_FZF_DELIMETER STYLES]
export use utils/state.nu [get_state update_state]
export use utils/icons.nu [get_toggle_icon]
export use actions.nu [change_header join_actions reload_input]


# for performance reasons it's better to stream the input to sfzf
export def main [
	input_getter?: list<string> # a script call to get the inputs again
	--binds (-b) = [] :table<events_keys:list<string>, action:string>
	--params (-p) = {} :record # fzf params
]: string -> string {

	let header_params = make_header_params $params
	let footer_params = make_footer_params $params
	let binds_params = make_binds_params $binds


	update_internal_state {
		input_getter: $input_getter
		header: $params.header?
	}

	let stringified_params = $DEFAULT_PARAMS
	| merge $params
	| merge $header_params
	| merge $footer_params
	| merge $binds_params
	| params stringify $in

	$in | fzf ...$stringified_params
}
