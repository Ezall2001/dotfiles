use ../../../hyprland/hyp_menu [main]
use ../../utils.nu [userscript_write]
use consts.nu [MENU_CMD MENU_PARAMS SOCKET]

export use ./menu.nu [_menu]

export def main [] {
	hyprctl clients -j | from json
	| where class == org.qutebrowser.qutebrowser
	let active_win = hyprctl activewindow -j | from json

	hyp_menu $MENU_CMD qtb_session $MENU_PARAMS

	let session = socat UNIX-LISTEN:($SOCKET) -


	userscript_write [
		'session-save'
		$'session-load -c ($session)'
		'set session.default_name = $selected'
	]
}
