export def main [title:string] {
	{
		name: $'hyp menu ($title)'
		check: {|client|
			$client.class == 'com.mitchellh.ghostty' and $client.title == $title
		}
	}
}
