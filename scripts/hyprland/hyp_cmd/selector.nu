use ./consts.nu [WINDOW_CLASS WINDOW_RULES IPC_FILE]
use ./params.nu [get_params]
use ../../sfzf [main]
use ../../uschedule [wait_until]

export def select [] {
	let cmds = get_cmds
	let input = $cmds | get name | str join "\n"
	let params = get_params

	$input | sfzf --params $params | save -f $IPC_FILE
}

export def lunch_selector [] {
	'' | save -f $IPC_FILE

	hyprctl dispatch -- exec $WINDOW_RULES $"ghostty --class=($WINDOW_CLASS) -e 'hyp_cmd _select'"
	sleep 500ms

	wait_until 100ms {
		hyprctl clients
		| rg $'class: ($WINDOW_CLASS)'
		| collect | is-empty
	}
}
