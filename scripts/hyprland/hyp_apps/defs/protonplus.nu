export def main [] {
	{
		name: 'protonplus'
		tags: [package_manager]
		exec: 'protonplus'
		check: {|client| $client.class == 'com.vysp3r.ProtonPlus'}
	}
}
