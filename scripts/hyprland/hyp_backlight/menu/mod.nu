use ../../../sfzf [main]
use ./binds.nu [get_binds]
use ./input.nu [get_input]
use ./params.nu [get_params]


export def _menu [] {
	let params = get_params
	let binds = get_binds

	get_input | sfzf [hyp_backlight _input] --params $params --binds ($binds)
}
