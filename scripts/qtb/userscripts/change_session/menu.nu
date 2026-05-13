use ../../utils.nu [userscript_write]
use ../../session/list.nu [main]
use ../../../sfzf [main]
use ./consts.nu [SFZF_PARAMS SOCKET]

def get_input [] {
	let used = hyprctl clients -j | from json
	| where class == org.qutebrowser.qutebrowser
	| get initialTitle

	list | where $it not-in $used | str join "\n"
}

export def _menu [] {
	let selected = get_input
	| sfzf --params $SFZF_PARAMS

	$selected | socat - UNIX-CONNECT:($SOCKET)
}
