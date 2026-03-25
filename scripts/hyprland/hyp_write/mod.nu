def paste_strategy [address:string str:string] {
	$str | clipse -c
	hyprctl dispatch focuswindow address:($address)
	hyprctl dispatch sendshortcut CTRL SHIFT, V, address:($address)
}

def wtype_strategy [address:string str:string] {
	hyprctl dispatch focuswindow address:($address)
	wtype $str
}

def get_active_address [] {
	hyprctl activewindow -j | from json | get address
}

export def _main [str:string strategy:string address?:string] {
	let pid = $address | default (get_active_address)

	let client = hyprctl clients -j | from json |
	where address == $address | first

	if ($client | is-empty) { return }

	match $strategy {
		paste => (paste_strategy $address $str)
		type => (wtype_strategy $address $str)
	}
}

export def main [str:string strategy:string  address?:string] {
	_main $str $strategy $address
}
