use ../hyp_setups
use ../../pacpac

export use ./init_windows.nu [main]
export use ./init_waybar.nu [main]
export use ./init_other.nu [main]
export use ./init_focus.nu [main]
export use ./init_hyp_events.nu [main]

export def _main [] {
	hyp_setups init
	pacpac lockfile init
	init_hyp_events
	init_waybar
	init_other
	init_windows
	init_focus
}

export def main [] {_main}
