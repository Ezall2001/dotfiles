use ./utils.nu [increase_brightness decrease_brightness set_brightness get_brightness]
use ../hyp_utils [get_active_ws col_to_mon]
use ../hyp_setups [get_setup]
use ./consts.nu [NOTIF_ID ICON_PATH NOTIF_NAME]

def get_active_mon_backlight [] {
	let setup = get_setup
	let ws = get_active_ws ($setup)
	if $ws == null {return}
	$setup.monitors | get $ws.col | get backlight
}

def _update [direction:int pct:int --name(-n):string --notify(-t)] {
	let name = $name | default (get_active_mon_backlight)

	if $name == null {
		notify-send -t 3000 'no active monitor'
		return
	}

	if $direction == 1 {
		increase_brightness $name $pct
	} else {
		decrease_brightness $name $pct
	}

	if not $notify { return }
	let brighttness = get_brightness $name

	run-external ...[
		notify-send
		-t 3000 -u low
		--icon $ICON_PATH
		--app-name $NOTIF_NAME
		--replace-id $NOTIF_ID
		-h int:value:($brighttness)
		$name
	]
}

export def increase [pct:int --name(-n):string --notify(-t)] {
	_update 1 $pct --name=$name --notify=$notify
}

export def decrease [pct:int --name(-n):string --notify(-t)] {
	_update -1 $pct --name=$name --notify=$notify
}
