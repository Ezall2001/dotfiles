def check [client:record session:string] {
	let has_class = $client.class == 'org.qutebrowser.qutebrowser'
	let has_init_title = $client.initialTitle == $session

	$has_class and $has_init_title
}

export def main [session:string] {
	let tags = [$'qtb_($session)' browser]
	let tags = if $session == llm {[...$tags llm]} else {$tags}

	{
		name: $'qutebrowser ($session)'
		tags: $tags
		exec: $'qtb_session start ($session)'
		check: {|client| check $client $session }
	}
}
