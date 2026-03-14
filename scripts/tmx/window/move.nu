alias reindex = run-external 'tmux' 'move-window' '-r'

export def main [target:int]: nothing -> nothing {
	let src = tmux display-message -p '#I' | into int

	if $src == $target {
		reindex
		return null
	}

	let flag = if $src > $target {'-b'} else {'-a'}

	tmux move-window $flag '-t' $':($target)'
	reindex
}
