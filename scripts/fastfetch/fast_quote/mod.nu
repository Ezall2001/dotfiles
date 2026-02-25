use ./consts.nu [CACHE_FILE DEFAULT_QUOTE]
use ./format.nu [main]
use ./refresh.nu [main]

export def _main [line:oneof<string,int>] {
	let cache = try {
		open $CACHE_FILE
	} catch {
		if $line == 'header' {refresh}
		return (format $DEFAULT_QUOTE $line)
	}

	if ($line == 'header') and (date now) > ($cache.ttl | into datetime) {
		refresh
	}

	format ($cache.quote) $line
}

export def main [line:oneof<string,int>] {
	_main $line
}
