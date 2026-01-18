use ./spawned_handler.nu [main]
use ./new_menu_handler.nu [main]
use ./consts.nu [DEFAULT_PARAMS]

def get_spawned [title:string] {
	hyprctl clients -j | from json
	| where title == $title | first
}

export def _main [cmd:list<string> title:string params:record] {
	let client = get_spawned $title
	let params = $DEFAULT_PARAMS | merge $params

	if $client == null {
		new_menu_handler $cmd $title $params
	} else {
		spawned_handler $client
	}
}

export def main [cmd:list<string> title:string params={}:record] { _main $cmd $title $params }
