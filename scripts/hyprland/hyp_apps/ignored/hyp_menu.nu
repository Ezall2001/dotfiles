export def main [] {
	{
		name: 'hyp menu'
		check: {|client| $client.title == 'hyp_menu'}
	}
}
