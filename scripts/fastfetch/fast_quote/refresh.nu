use ../consts.nu [CACHE_DIR]
use ./consts.nu [CACHE_FILE URL DEFAULT_QUOTE]

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
	mkdir $CACHE_DIR
	$cache | save -f $CACHE_FILE
}
