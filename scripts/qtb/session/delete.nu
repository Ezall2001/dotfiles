use ../consts.nu [session_base_dir session_file]
use ./list.nu [main]

export def main [session:string@list] {
	let active = hyprctl clients -j | from json
	| where initialTitle == $session | first

	if ($active != null) {kill -9 $active.pid}

	let base_dir = session_base_dir $session
	try {gtrash put $base_dir}

	let session_file = session_file $session
	try {gtrash put $session_file}
}
