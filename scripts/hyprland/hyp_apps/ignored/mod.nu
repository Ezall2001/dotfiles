use ./hyp_menu.nu [main]

export def get_ignored [] {
	[
		(hyp_menu clipse)
		(hyp_menu hyp_keymap)
		(hyp_menu hyp_emoji)
		(hyp_menu hyp_cmd)
		(hyp_menu hyp_lunch)
	]
}

export def is_ignored [client:record] {
	get_ignored | where (do $it.check $client) | length | $in > 0
}
