use ../hyprland/hyp_menu [main]
use ./consts.nu [PARAMS]

export use ./unlock.nu [main]
export use ./exposed
export use ./init.nu [main]
export use ./sync.nu [main]

export def _main [] {
	hyp_menu [bbw _menu] bbw $PARAMS
}

export def main [] {
	_main
}
