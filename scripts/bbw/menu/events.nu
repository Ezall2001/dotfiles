use ../../sfzf [join_actions change_header]
use ./header.nu [get_header]

export def on_focus_change [item:string] {
	let item = $item | from json
	let header = get_header null $item

	join_actions [
		(change_header $header)
	]
}
