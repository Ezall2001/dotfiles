use rmpc.nu [main]
use qutebrowser.nu [main]
use tmux.nu [main]
use obsidian.nu [main]
use ghostty.nu [main]
use zen.nu [main]
use lutris.nu [main]

# NOTE: order matters
export def get_apps [] {
	[
		(lutris)
		(rmpc)
		(qutebrowser general)
		(qutebrowser llm)
		(tmux)
		(obsidian)
		(zen)
		(ghostty)
	]
}
