const BINDS = [
	{
		events_keys:['alt-b']
		action:'transform[hyp_backlight _action set_brightness {4} 0]'
	}
]

def get_brightness_binds [] {
	1..10 | each {|n|
		let br = $n * 10
		{
			events_keys:[$'f($n)']
			action:$'transform[hyp_backlight _action set_brightness {4} ($br)]'
		}
	}
}


export def get_binds [] {
	let brightness_binds = get_brightness_binds
	$BINDS ++ $brightness_binds
}
