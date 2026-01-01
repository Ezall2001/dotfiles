use ./defs [get_cmds]
use ./selector.nu [lunch_selector]
use ./consts.nu [IPC_FILE]


export def _main [] {
	lunch_selector

	let cmd_name = open $IPC_FILE | str trim
	if $cmd_name == '' { return }

	let cmd = get_cmds | where name == $cmd_name | first

	if $cmd == null {
		notify-send -u critical -t 3000 $'command ($cmd_name) not found'
		return
	}

	do $cmd.exec
}

export def main [] { _main }
