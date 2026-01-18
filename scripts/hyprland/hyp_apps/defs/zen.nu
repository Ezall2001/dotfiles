export def main [] {
	{
		name: 'zen browser'
		tags: [zen_browser browser]
		exec: 'zen-browser'
		check: {|client| $client.class == zen}
	}
}
