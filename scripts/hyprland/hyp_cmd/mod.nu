use ../hyp_menu [main]
use ./params.nu [get_params]
use ../../sfzf [main]

export use ./defs [get_cmds]

def select [] {
	let cmds = get_cmds
	let input = $cmds | get name | str join "\n"
	let params = get_params

	$input | sfzf --params $params
}



export def _menu [] {
	let cmd_name = select

	if $cmd_name == '' { return }

	let cmd = get_cmds | where name == $cmd_name | first

	if $cmd == null {
		notify-send -u critical -t 3000 $'command ($cmd_name) not found'
		return
	}

	do $cmd.exec
}

export def _main [] {
	hyp_menu [hyp_cmd _menu] hyp_cmd
}

export def main [] { _main }
