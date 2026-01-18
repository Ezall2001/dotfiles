use ./reload_waybar.nu [main]
use ./toggle_blue_filter.nu [main]

export def get_cmds [] {
	[
		(reload_waybar)
		(toggle_blue_filter)
	]
}
