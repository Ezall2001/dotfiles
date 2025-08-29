export def main [direction?:string --toggle_floating (-f)] {
	let active_win = hyprctl activewindow -j | from json

	if $toggle_floating {
		let next_state = if $active_win.floating {'tiled'} else {'floating'}
		hyprctl dispatch focuswindow $next_state
	} else {
		hyprctl dispatch movefocus $direction
	}

	hyprctl dispatch movecursortocorner 2
}
