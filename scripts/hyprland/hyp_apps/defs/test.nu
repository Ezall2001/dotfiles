export def main [] {
	{
		name: 'test'
		tags: [test]
		exec: 'ghostty --title=test'
		check: {|client| $client.title == test}
	}
}
