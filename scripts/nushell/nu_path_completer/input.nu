use ../../sfzf [get_state]
use consts.nu [STARTS]


export def get_input []: nothing -> string {
	let state = get_state
	let start = $STARTS | get $state.start | path expand

	let hidden = if $state.hidden {'--hidden'} else {'--no-hidden'}
	let ignored = if $state.ignored {'--no-ignore'} else {'--ignore'}
	let type = if $state.dir {'--type=d'} else {'--type=f'}

	fd --base-directory $start $hidden $ignored $type .
}
