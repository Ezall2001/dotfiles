use ./math.nu [monitor_scaled_size]
use ../consts.nu [SCREEN_GAP]

def get_mon [mon?:string] {
	if $mon != null {
		let mon = hyprctl monitors -j | from json | where name == $mon | first
		return $mon
	}

	let mon_id = hyprctl activeworkspace -j | from json | get monitorID

	hyprctl monitors -j | from json
	| where id == $mon_id | first
}

def get_window [address?:string] {
	if $address != null {
		let window = hyprctl clients -j | from json
		| where address == $address | first
		return $window
	}

	hyprctl activewindow -j | from json
}

def get_cursor [] {
	hyprctl cursorpos | split row ',' | each {str trim | into int}
}

export def main [expr:string address?:string mon?:string] {
	let window = get_window $address
	let mon = get_mon $mon | monitor_scaled_size $in

	let cursor = get_cursor

	#TODO: make this relative to monitor by default
	let expr = $expr | str replace -a 'monitor_x' ($mon.x | into string)
	let expr = $expr | str replace -a 'monitor_y' ($mon.y | into string)
	let expr = $expr | str replace -a 'monitor_w' ($mon.scaled_w | into string)
	let expr = $expr | str replace -a 'monitor_h' ($mon.scaled_h | into string)

	let expr = $expr | str replace -a 'window_x' ($window.at.0 | into string)
	let expr = $expr | str replace -a 'window_y' ($window.at.1 | into string)
	let expr = $expr | str replace -a 'window_w' ($window.size.0 | into string)
	let expr = $expr | str replace -a 'window_h' ($window.size.1 | into string)

	let expr = $expr | str replace -a 'cursor_x' ($cursor.0 | into string)
	let expr = $expr | str replace -a 'cursor_y' ($cursor.1 | into string)

	qalc -t +u8 $expr | into int
}
