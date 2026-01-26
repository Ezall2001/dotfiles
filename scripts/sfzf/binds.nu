use consts.nu [BINDS]

def stringify_bind [bind:record] {
	$bind.events_keys | str join ','
	| $'($in):($bind.action)'
}

export def make_binds_params [binds?:table] {
	let user_binds = $binds | default []
	#TODO: spread over events_keys and merge the actions
	# (events and keys can be defined multiple times)
	let binds_str = $BINDS | append $user_binds
	| each {stringify_bind $in}
	| str join ','

	{bind: $binds_str}
}
