use ../hyp_menu [main]
use ../../sfzf [main]
use ./input.nu [get_input]
use ./params.nu [get_params]
use ./consts.nu [BINDS]
use ../hyp_write [main]

export def _menu [address?:string] {
	let params = get_params

	let output = get_input |
	sfzf --params $params --binds $BINDS |
	lines | str join " "

	if $address == null {return}
	hyp_write $output paste $address
}

export def _main [] {
	let active_client = hyprctl -j activewindow | from json
	let address = if ($active_client | is-empty) {''} else {$active_client.address}

	hyp_menu [hyp_emoji _menu $address] hyp_emoji
}

export def main [] { _main }
