use ./select.nu [main]
use ../consts.nu [session_base_dir CONFIG_ENTRY]

export def main [session?:string] {
	let session = if $session == null {
		select
	} else {$session}

	let base_dir = session_base_dir $session


	let cmd = [
		qutebrowser
		--restore $session
		--basedir $base_dir
		--set session.default_name $session
		--config-py $CONFIG_ENTRY
		--qt-arg qwindowtitle $session
	]

	run-external ...$cmd
}
