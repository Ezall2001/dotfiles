use ../hyp_menu [main]

export def main [] {
	_main
}

export def _main [] {
	let cmd = []
	hyp_menu [hyp_notification _menu] hyp_notification {size:[1000 600]}
}
