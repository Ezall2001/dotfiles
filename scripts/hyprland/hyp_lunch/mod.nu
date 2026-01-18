use ../hyp_menu [main]
use ./params.nu [get_params]
use ../../sfzf [main]
use ../hyp_apps [get_apps]

def lunch [name:string] {
	if $name == '' {return}

	let app = get_apps | where name == $name | first

	if $app == null {
		notify-send -u critical -t 3000 $'app: ($app.name) not found'
		return
	}

	hyprctl dispatch -- exec $app.exec
}

export def _menu [] {
	let params = get_params

	let name = get_apps | get name | str join "\n"
	| sfzf --params $params

	lunch $name
}

export def _main [name?:string] {
	let name = if $name != null {
		lunch $name
	} else {
		hyp_menu [hyp_lunch _menu] hyp_lunch
	}
}

export def main [name?:string] {
	_main $name
}
