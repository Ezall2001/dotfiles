const BINDS = [
	{
		events_keys:['alt-u']
		action:'transform[hyp_notification _action pause 0]'
	}
	{
		events_keys:['alt-x']
		action:'transform[hyp_notification _action delete {1}]'
	}
	{
		events_keys:['alt-X']
		action:'transform[hyp_notification _action clear]'
	}
]

def get_pause_binds [] {
	0..9 | each {|n|
		let br = if $n == 0 {100} else {$n * 10}
		{
			events_keys:[$'alt-($n)']
			action:$'transform[hyp_notification _action pause ($br)]'
		}
	}
}


export def get_binds [] {
	let pause_binds = get_pause_binds
	$BINDS ++ $pause_binds
}
