use ../consts.nu [STATE_FILE INTERNAL_STATE_FILE]

export def get_state [] { try {open $STATE_FILE} catch {{}} }

export def update_state [new_state:record old_state?:record] {
	let state = $old_state
	| default (get_state)
	| merge $new_state

	$state | to json -r | save -f $STATE_FILE
	$state
}

export def get_internal_state [] {try {open $INTERNAL_STATE_FILE} catch {{}}}

export def update_internal_state [new_state:record old_state?:record] {
	let state = $old_state
	| default (get_internal_state)
	| merge $new_state

	$state | to json -r | save -f $INTERNAL_STATE_FILE
	$state
}
