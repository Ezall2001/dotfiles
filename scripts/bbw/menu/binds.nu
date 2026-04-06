use consts.nu [EVENTS BINDS]

export def get_binds [] {
	1..10 | each {|num|
		{
			events_keys:[$'f($num)']
			action:$"transform\(bbw _action yank ($num - 1) {1})"
		}
	}
	| $in ++ $EVENTS ++ $BINDS
}
