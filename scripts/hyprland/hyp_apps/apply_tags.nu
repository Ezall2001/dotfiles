use ./defs [get_apps]

def apply_tag [client:record app:record] {
	for tag in $app.tags {
		hyprctl dispatch tagwindow +($tag) address:($client.address)
	}
}

export def main [addr:string] {
	let client = hyprctl clients -j | from json
	| where address == $addr | first

	for app in (get_apps) {
		if (do $app.check $client) {
			apply_tag $client $app
			return
		}
	}
}
