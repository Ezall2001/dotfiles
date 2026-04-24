use ../consts.nu [session_base_dir CONFIG_ENTRY]
use ./list.nu [main]

export def main [session:string@list] {
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
