use ../nushell/nui
use consts.nu [STATE_PATH DEFAULT_STATE]

export def typename [type:int] {
	match $type {
		1 => 'login'
		2 => 'secure note'
		3 => 'card'
		4 => 'identity'
		5 => 'ssh key'
		_ => 'unknown'
	}
}

export def key_path [] {
	let uid = id -u
	'/run/user' | path join $uid
	| path join bbw
}

export def get_state [] {
	try {open $STATE_PATH} catch {DEFAULT_STATE}
}

export def update_state [new_state:record old_state?:record] {
	let old_state = if $old_state == null {
		get_state
	} else {$old_state}

	let updated_state = $old_state | merge $new_state
	$updated_state | to json | nui save -f $STATE_PATH

	$updated_state
}
