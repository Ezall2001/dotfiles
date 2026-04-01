use consts.nu [TIMEOUT_EXIT_VALUE]
use messages.nu [std_message is_std_message is_timeout_message]

export def await [...tags --timeout (-t):duration --silent (-s)]: nothing -> list<any> {
	let timeout_id = if $timeout != null {
		spawn $TIMEOUT_EXIT_VALUE {sleep $timeout; $TIMEOUT_EXIT_VALUE}
	} else {null}

	mut messages = []

	loop {
		let msg = job recv

		let should_timeout = ($timeout != null) and (is_timeout_message $msg $timeout_id)

		if $should_timeout and (not $silent) {
			print $"await on ($tags | str join ', ') timed-out after ($timeout | into string)"
		}
		if $should_timeout { break }

		$messages = $messages | append $msg

		let is_done = job list | where tag in $tags | is-empty
		if $is_done { break }
	}

	$messages
}

export def spawn [tag:string closure:closure] {
	let p_id = job id

	let id = job spawn {
		try {
			let val = do $closure
			std_message $tag $val --finished | job send $p_id
		} catch {|e|
			std_message $tag $e --error | job send $p_id
		}
	}

	job tag $id $tag
	$id
}

export def main [] {}
