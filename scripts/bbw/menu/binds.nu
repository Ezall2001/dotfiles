use consts.nu [EVENTS BINDS]

export def get_binds [] {
	0..9 | each {|num|
		{
			events_keys:[$'alt-($num)']
			action:$"transform\(bbw _action yank ($num) {1})"
		}
	}
	| $in ++ $EVENTS ++ $BINDS
}
