use ../consts.nu [HYP_SETUP_STATE_FILE]

export def get_state [] {
	open $HYP_SETUP_STATE_FILE
}

export def update_state [new:record old?:record]: nothing -> record {
	let old = $old | default (get_state)
	let new = $old | merge $new

	$new | save -f $HYP_SETUP_STATE_FILE

	$new
}
