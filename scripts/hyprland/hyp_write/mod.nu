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

export def _hyp_write [str:string address?:string] {
	let pid = $address | default (get_active_address)

	let client = hyprctl clients -j | from json |
	where address == $address | first

	if ($client | is-empty) { return }

	if ($client.class == 'com.mitchellh.ghostty') {
		paste_strategy $address $str
	} else {
		wtype_strategy $address $str
	}
}

export def main [str:string address?:string] {
	_hyp_write $str $address
}
