use ./wait_until.nu [main]

export def main [cb:closure, interval:duration, tag:string] {
	let job = job list | where description == $tag | first

	let _cb = {
		sleep $interval
		do $cb
	}

	if $job != null {
		job kill $job.id
	}

	job spawn --description $tag $_cb
	null
}

export def await [tag:string --timeout(-t):duration] {
	let check = {
		job list | where description == $tag | is-empty
	}

	wait_until --timeout $timeout 50ms $check
	null
}
