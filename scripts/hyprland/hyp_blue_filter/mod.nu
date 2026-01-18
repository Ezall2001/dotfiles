const FILTER_TEMP = 5000
const NORMAL_TEMP = 7000

export def set [] {
	hyprctl hyprsunset temperature $FILTER_TEMP
}

export def unset [] {
	hyprctl hyprsunset temperature $NORMAL_TEMP
}

export def _main [] {
	let temp = hyprctl hyprsunset temperature | into int

	if $temp == $FILTER_TEMP {
		unset
	} else {
		set
	}
}

export def main [] {_main}
