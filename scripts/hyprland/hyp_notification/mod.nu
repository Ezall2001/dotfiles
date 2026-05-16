use ../hyp_menu [main]
use ./consts.nu [HYP_MENU_PARAMS]

export def main [] {
	_main
}

export def _main [] {
	let cmd = []
	hyp_menu [hyp_notification _menu] hyp_notification $HYP_MENU_PARAMS
}
