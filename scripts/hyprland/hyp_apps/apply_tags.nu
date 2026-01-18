use ./get_apps.nu [main]

def apply_tag [client:record app:record] {
	for tag in $app.tags {
		hyprctl dispatch tagwindow +($tag) address:($client.address)
	}
}

export def main [client:record] {
	for app in (get_apps) {
		if (do $app.check $client) {
			apply_tag $client $app
			return
		}
	}
}
