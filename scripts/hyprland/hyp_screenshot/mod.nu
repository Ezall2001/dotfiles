use ./const.nu [SCREENSHOT_DIR]

def init [] {if not ($SCREENSHOT_DIR | path exists) {mkdir $SCREENSHOT_DIR}}

def get_name [] {
	let last = ls $SCREENSHOT_DIR |
	get name |
	each {
		path basename | parse 'screenshot_{id}.png' |
		get id | first | into int
	} | sort | last

	if $last == null {
		return 'screenshot_0.png'
	}

	let id = $last + 1
	return $'screenshot_($id).png'
}

def copy_path [name:string] {
	let path = $SCREENSHOT_DIR | path join $name
	clipse -a $path
}

export def _main [mode: string, active:bool]: [nothing -> nothing] {
	hyprctl dispatch submap reset
	init

	let name = get_name

	if $active {
		hyprctl dispatch -- exec hyprshot -o $SCREENSHOT_DIR -f $name -m $mode -m active -t 2000
		copy_path $name
		return
	}

	if not (ps | where name == slurp | is-empty) {return}
	hyprctl dispatch -- exec hyprshot -o $SCREENSHOT_DIR -f $name -m $mode -t 2000
	copy_path $name
}

export def main [mode:string, --active (-a)] {_main $mode $active}
