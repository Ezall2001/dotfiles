export def main [] {
	{
		name: 'lutris'
		tags: [game launcher]
		exec: 'lutris'
		check: {|client| $client.class == 'net.lutris.Lutris'}
	}
}
