use consts.nu [BACKED_DIRS DIFF_PATH]

export def print_diff [] {
	let changes = open $DIFF_PATH | lines
	| where not ($it | str starts-with '=')

	let added = $changes | where ($it | str starts-with '+')
	let deleted = $changes | where ($it | str starts-with '-')
	let modified = $changes | where ($it | str starts-with '*')
	let other = $changes | where ($it | str substring 0..0) not-in ['+' '-' '*']

	($other ++ $added ++ $deleted ++ $modified) | str join "\n"
	| bat --tabs 2 --theme base16 --language Diff
}

export def get_includes [] {
	$BACKED_DIRS | each {|d|
		let dir = $"($d)/**"
		[--include $dir]
	} | flatten
}
