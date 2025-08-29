const MARGIN = 7 # 5 for screen gap, 2 for border width
const MOVE_COOF_UP_DOWN = 0.05
const MOVE_COOF_LEFT_RIGHT = 0.05

def get_coof_vect [direction:string] {
	 match $direction {
		u => [0 ($MOVE_COOF_UP_DOWN * -1)]
		d => [0 $MOVE_COOF_UP_DOWN]
		r => [$MOVE_COOF_LEFT_RIGHT 0]
		l => [($MOVE_COOF_LEFT_RIGHT * -1) 0]
	}
}

def snap_left [pos:list<int> v:list<number> mon:record] {
	let d = $pos.0 - $mon.x
	let min_d = $v.0 | math abs

	if $d > $min_d or $d < 0 { return $pos }

	let snap_x = $mon.x + $MARGIN
	[$snap_x $pos.1]
}

def snap_right [pos:list<int> v:list<number> win:record mon:record] {
	let right_mon_x = $mon.x + ($mon.width / $mon.scale) | math floor 
	let right_x = $pos.0 + $win.size.0

	let d = $right_mon_x - $right_x
	let min_d = $v.0 | math abs

	if $d > $min_d or $d < 0 { return $pos }

	let snap_x = $right_mon_x - $MARGIN - $win.size.0
	[$snap_x $pos.1]
}

def snap_up [pos:list<int> v:list<number> mon:record] {
	let d = $pos.1 - $mon.y
	let min_d = $v.1 | math abs

	if $d > $min_d or $d < 0 { return $pos }

	let snap_y = $mon.y + $MARGIN
	[$pos.0 $snap_y]
}

def snap_down [pos:list<int> v:list<number> win:record mon:record] {
	let bottom_mon_y = $mon.y + ($mon.height / $mon.scale) | math floor 
	let bottom_y = $pos.1 + $win.size.1

	let d = $bottom_mon_y - $bottom_y
	let min_d = $v.1 | math abs

	if $d > $min_d or $d < 0 { return $pos }

	let snap_y = $bottom_mon_y - $MARGIN - $win.size.1
	[$pos.0 $snap_y]
}

export def main [direction:string] {
	let active_win = hyprctl activewindow -j | from json

	if (not $active_win.floating) {
		hyprctl dispatch movewindow $direction
		return
	}

	let coof = get_coof_vect $direction

	let active_mon = hyprctl monitors -j | from json | where id == $active_win.monitor | first

	let v = [($active_mon.width * $coof.0) ($active_mon.height * $coof.1)]
	mut pos = [($active_win.at.0 + $v.0 | math ceil) ($active_win.at.1 + $v.1 | math ceil)]

	$pos = snap_left $pos $v $active_mon
	$pos = snap_right $pos $v $active_win $active_mon
	$pos = snap_up $pos $v $active_mon
	$pos = snap_down $pos $v $active_win $active_mon

	hyprctl dispatch movewindowpixel exact $'($pos.0) ($pos.1),pid:($active_win.pid)'
}
