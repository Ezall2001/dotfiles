use ./utils/state.nu [update_internal_state get_internal_state]

export def change_header [header:string]: nothing -> string {
	let header_cols = ($env.FZF_COLUMNS | into int) - ($env.FZF_PREVIEW_COLUMNS | into int)

	update_internal_state {header:$header}
	# let l = $header | ansi strip | str length -g

	$'change-header[($header)]'
	# $'execute[print `($header)` ($header_cols) ($l)]'
}

export def reload_input []: nothing -> string {
	let cmd = get_internal_state | get input_getter | str join ' '
	$'reload[($cmd)]'
}

export def join_actions [actions:list<string>]: nothing -> string {
	$actions | str join '+'
}
