export def main [...patterns] {
	let pane_tty = tmux display-message -p "#{pane_tty}"

	let patterns = $patterns | each {$"\(($in))"} | str join '|'
	^ps -o state= -o comm= -t ($pane_tty) | rg $patterns
}
