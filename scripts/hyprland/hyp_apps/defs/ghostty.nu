export def main [] {
	{
		name: 'ghostty'
		tags: [ghostty terminal]
		exec: 'ghostty'
		check: {|client| $client.class == 'com.mitchellh.ghostty'}
	}
}
