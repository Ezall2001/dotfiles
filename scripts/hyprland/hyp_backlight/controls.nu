use ./utils.nu [increase_brightness decrease_brightness set_brightness get_brightness]
use ../hyp_utils [get_active_ws col_to_mon]
use ../hyp_setups [get_setup]

def get_active_mon_backlight [] {
	let setup = get_setup
	let ws = get_active_ws ($setup)
	if $ws == null {return}
	$setup.monitors | get $ws.col | get backlight
}

export def increase [pct:int --name (-n):string] {
	let name = $name | default (get_active_mon_backlight)

	if $name == null {
		notify-send -t 3000 'no active monitor'
		return
	}

	increase_brightness $name $pct
}

export def decrease [pct:int --name (-n):string] {
	let name = $name | default (get_active_mon_backlight)

	if $name == null {
		notify-send -t 3000 'no active monitor'
		return
	}

	decrease_brightness $name $pct
}
