use ./consts.nu [STATE_FILE URL DEFAULT_QUOTE]
use ../../nushell/nui

export def main [] {
	hyprctl dispatch exec fast_quote _refresh | ignore
}

export def _refresh [] {
	let res = http get $URL

	let quote = if $res.status != success {
		$DEFAULT_QUOTE
	} else {
		{
			body: $res.data.content
			character: $res.data.character.name
			source: $res.data.anime.name
		}
	}

	let ttl = (date now) + 12min

	let cache = {quote:$quote ttl:$ttl}
	$cache | nui save -f $STATE_FILE
}
