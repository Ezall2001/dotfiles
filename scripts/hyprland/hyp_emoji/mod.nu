const class = 'ghostty.emoji'
const window_rule = '[float; size 500 700; move (monitor_w-window_w-7) (monitor_h-window_h-7)]'

export def _main [] {
	let is_spawned = hyprctl clients | rg $'class: ($class)' | collect | is-empty | not $in
	let active_client = hyprctl -j activewindow | from json
	let pid = if ($active_client | is-empty) {-1} else {$active_client.pid}

	if ($is_spawned) {
		hyprctl dispatch focuswindow class:($class)
	} else {
		hyprctl dispatch -- exec $window_rule $"ghostty --class=($class) -e 'hyp_emoji _sfzf ($pid)'"
	}
}

export def main [] { _main }
