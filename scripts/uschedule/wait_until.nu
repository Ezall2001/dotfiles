export def main [check_interval:duration check:closure --timeout (-t):duration] {
	let start = date now

	loop {
		let curr = date now
		if ($timeout != null) and ($curr - $start) >= $timeout {return}
		if (do $check) { return }
		sleep $check_interval
	}
}
