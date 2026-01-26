use ../hyp_menu [main]
use ./params.nu [get_params]
use ../hyp_utils [get_exec_rules post_exec_rules]
use ../../sfzf [main]
use ../hyp_apps [get_apps]
use ../../uschedule [wait_until]

def find_client [app:record] {
	hyprctl clients -j | from json
	| where (do $app.check $it) | first
}

def lunch [name:string params?:record] {
	if $name == '' {return}

	let app = get_apps | where name == $name | first

	if $app == null {
		notify-send -u critical -t 3000 $'app: ($app.name) not found'
		return
	}

	if $params == null {
		hyprctl dispatch -- exec $app.exec
		return
	}

	let exec_rules = get_exec_rules $params
	hyprctl dispatch -- exec $exec_rules $app.exec

	wait_until --timeout 3sec 100ms {
		find_client $app | is-not-empty
	}

	let client = find_client $app
	if $client == null {return}

	post_exec_rules $client.address $params
}

export def _menu [] {
	let params = get_params

	let name = get_apps | get name | str join "\n"
	| sfzf --params $params

	lunch $name
}

export def _main [name?:string params?:record] {
	let name = if $name != null {
		lunch $name $params
	} else {
		hyp_menu [hyp_lunch _menu] hyp_lunch
	}
}

export def main [name?:string params?:record] {
	_main $name $params
}
