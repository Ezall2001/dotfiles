const BINDS = [
	{
		events_keys:['alt-b']
		action:'transform[hyp_backlight _action set_brightness {4} 0]'
	}
]

def get_brightness_binds [] {
	0..9 | each {|n|
		let br = if $n == 0 {100} else {$n * 10}
		{
			events_keys:[$'alt-($n)']
			action:$'transform[hyp_backlight _action set_brightness {4} ($br)]'
		}
	}
}


export def get_binds [] {
	let brightness_binds = get_brightness_binds
	$BINDS ++ $brightness_binds
}
