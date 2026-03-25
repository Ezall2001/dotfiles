use ../hyp_write [main]
use ../hyp_menu [main]

export def _clipse [address?:string]: nothing -> nothing {
	clipse
	let val = try {wl-paste} catch {''}

	if ($env.LAST_EXIT_CODE != 0) or ($address == null) {return null}
	hyp_write $val paste $address
}

export def _main []: [nothing -> nothing] {
	let active_client = hyprctl activewindow -j | from json
	let address = if ($active_client | is-empty) {''} else {$active_client.address}
	hyp_menu [hyp_clipboard _clipse $address] 'clipse'
}

export def main [] { _main }
