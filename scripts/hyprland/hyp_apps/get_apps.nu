use ./defs/rmpc.nu [main]
use ./defs/qutebrowser.nu [main]
use ./defs/tmux.nu [main]
use ./defs/obsidian.nu [main]
use ./defs/ghostty.nu [main]
use ./defs/zen.nu [main]

# NOTE: order matters
export def main [] {
	[
		(rmpc)
		(qutebrowser general)
		(qutebrowser llm)
		(tmux)
		(obsidian)
		(zen)
		(ghostty)
	]
}
