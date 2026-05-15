use ./consts.nu [PAUSE_LVLS]

def get_current_dunst_lvl [] {
	dunstctl get-pause-level | into int
}

export def get_current_defined_lvl [] {
	let lvl = get_current_dunst_lvl
	let defined_lvls = $PAUSE_LVLS | enumerate | flatten

	for $dl in $defined_lvls {
		if $dl.val >= $lvl {
			return $dl
		}
	}

	return ($defined_lvls | last)
}


export def main [--lvl(-l):int --toggle(-t) --increase(-i) --decrease(-d)] {
	if $toggle {
		dunstctl set-paused toggle
	} else if $lvl != null {
		dunstctl set-pause-level $lvl
		return (dunstctl get-pause-level | into int)
	}

	let curr_idx = get_current_defined_lvl | get index
	let step = if $increase { 1 } else { -1 }
	let upper_bound = $PAUSE_LVLS | length | $in - 1

	let new_idx = $curr_idx + $step
	let new_idx = [$new_idx 0] | math max
	let new_idx = [$new_idx $upper_bound] | math min

	let new_lvl = $PAUSE_LVLS | get $new_idx | get val

	dunstctl set-pause-level $new_lvl
	$new_lvl
}
