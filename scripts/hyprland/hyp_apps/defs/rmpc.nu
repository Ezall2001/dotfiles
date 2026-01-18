export def main [] {
	{
		name: 'rmpc'
		tags: [rmpc terminal]
		exec: 'ghostty --title=rmpc -e rmpc'
		check: {|client| $client.title == rmpc}
	}
}
