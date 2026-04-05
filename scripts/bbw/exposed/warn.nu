use ../consts.nu [EXPOSED_PATH]

const msg = [
	'run `bbw exposed view` to see which ones'
	'run `bbw exposed resolved` after changing them'
] | str join "\n"

export def main [] {
	let str = open $EXPOSED_PATH

	if $str == '' { return }

	notify-send -u critical -t 5000 'password breach' $msg
}
