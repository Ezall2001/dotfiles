const to_highlight = [datetime filesize binary duration glob bool string number int float]

$env.config.hooks.display_output = {||
	if $in == null {
		return
	} else if ($in | describe) in $to_highlight {
		into string | nu-highlight | bat -p
	} else {
		table -e | bat -p
	}
}
