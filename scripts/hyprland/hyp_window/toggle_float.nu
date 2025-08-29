export def main [] {
	let active_win = hyprctl activewindow -j | from json

	if ($active_win.floating) {
		hyprctl dispatch settiled
		return
	}

	let width = $active_win.size.0 * 0.9 | into int
	let height = $active_win.size.1 * 0.9 | into int

	hyprctl dispatch setfloating
	hyprctl dispatch movewindowpixel exact $'($active_win.at.0) ($active_win.at.1),pid:($active_win.pid)'
	hyprctl dispatch resizewindowpixel exact $'($width) ($height),pid:($active_win.pid)'
}
