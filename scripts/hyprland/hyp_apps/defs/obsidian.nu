export def main [] {
	{
		name: 'obsidian'
		tags: ['notes']
		exec: 'obsidian'
		check: {|client| $client.class == obsidian }
	}
}
