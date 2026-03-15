export def main [multi:bool dir:bool selection:list<string>] {
	let did_select_multi = $selection | length | $in > 1
	if $did_select_multi and (not $multi) {
		notify-send -u CRITICAL 'operation failed' 'selected more than one item'
		return false
	}

	let are_all_dir = $selection | all { ($in | path type) == 'dir' }
	if $dir and not ($are_all_dir) {
		notify-send -u CRITICAL 'operation failed' 'selected a file instead of dir'
		return false
	}

	true
}
