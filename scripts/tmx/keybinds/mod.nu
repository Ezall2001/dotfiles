use ./consts.nu [PATTERNS]

export def main [] {
	let pane_tty = tmux display-message -p "#{pane_tty}"

	let patterns = $PATTERNS | each {$"\(($in))"} | str join '|'
	^ps -o state= -o comm= -t ($pane_tty) | rg $patterns
}
