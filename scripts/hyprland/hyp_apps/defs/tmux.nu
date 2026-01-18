export def main [] {
	{
		name: 'tmux'
		tags: [tmux terminal]
		exec: 'ghostty --title=tmux -e tmux attach'
		check: {|client| $client.title == tmux}
	}
}
