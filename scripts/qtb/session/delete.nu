use ./select.nu [main]
use ../consts.nu [session_base_dir session_file]

export def main [session?:string] {
	let session = if $session == null {
		select
	} else {$session}

	let active = hyprctl clients -j | from json
	| where initialTitle == $session | first

	if ($active != null) {kill -9 $active.pid}

	let base_dir = session_base_dir $session
	try {gtrash put $base_dir}

	let session_file = session_file $session
	try {gtrash put $session_file}
}
