export def EMOJI_PATH [] {
	$env.XDG_CONFIG_HOME | path join 'themes' 'emoji.json'
}

export const BINDS = [
	{
		events_keys:[alt-y]
		action:'bg-transform[hyp_emoji _action copy {+2}]'
	}
]
