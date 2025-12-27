def paste_strategy [pid:int str:string] {
	$str | clipse -c
	hyprctl dispatch focuswindow pid:($pid)
	hyprctl dispatch sendshortcut CTRL SHIFT, V, pid:($pid)
}

def wtype_strategy [pid:int str:string] {
	hyprctl dispatch focuswindow pid:($pid)
	wtype $str
}

def get_active_pid [] {
	hyprctl activewindow -j | from json | get pid
}

export def _hyp_write [str:string pid?:int] {
	let pid = $pid | default (get_active_pid)

	let client = hyprctl clients -j | from json |
	where pid == $pid | first

	if ($client | is-empty) { return }

	if ($client.class == 'com.mitchellh.ghostty') {
		paste_strategy $pid $str
	} else {
		wtype_strategy $pid $str
	}
}

export def main [str:string pid?:int] {
	_hyp_write $str $pid
}
