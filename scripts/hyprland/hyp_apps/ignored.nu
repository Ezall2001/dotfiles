use ./ignored/hyp_menu.nu [main]

export def get_ignored [] {
	[
		(hyp_menu)
	]
}

export def is_ignored [client:record] {
	get_ignored | where (do $it.check $client) | length | $in > 0
}
