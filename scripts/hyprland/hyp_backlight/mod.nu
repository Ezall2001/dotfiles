use ./utils.nu [set_brightness]
use ../hyp_menu [main]

export use ./controls.nu [increase decrease increase_mon decrease_mon]
export use ./utils.nu [get_brightness]

export def _main [name?:string pct?:int] {
	if $name == null or $pct == null {
		hyp_menu [hyp_backlight _menu] hyp_backlight
	} else {
		set_brightness $name $pct
	}
}

export def main [name?:string pct?:int] { _main $name $pct }
