use ../../nushell/nui/type [from_pct into_pct]

export def get_brightness [name:string]: nothing -> oneof<int,nothing> {
	try {
		brightnessctl -m -d $name i | split row ,
		| get 3 | from_pct
	} catch {null}
}

export def set_brightness [name:string pct:int]: nothing -> bool {
	let pct = $pct | into_pct
	try {
		brightnessctl -d $name s $pct | ignore
		true
	} catch {false}
}

export def increase_brightness [name:string step:int]: nothing -> bool {
	let curr = (get_brightness $name) | default (-1)
	if $curr == (-1) {return}

	set_brightness $name ($curr + $step)
}

export def decrease_brightness [name:string step:int]: nothing -> bool {
	let curr = get_brightness $name | default (-1)
	if $curr == (-1) {return}

	set_brightness $name ($curr - $step)
}
