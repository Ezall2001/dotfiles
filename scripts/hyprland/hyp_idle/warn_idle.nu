use ../hyp_backlight [get_brightness set_brightness]
use ../hyp_setups [get_backlight_devices]
use ./consts.nu [CACHE_FILE]

export def main [] {
	let devs = get_backlight_devices
	| insert brightness {|dev|
		get_brightness $dev.backlight
	}

	$devs | to json | save -f $CACHE_FILE

	$devs | where type == monitor | each {|dev|
		if $dev.brightness != null and $dev.brightness <= 5 {return}
		set_brightness $dev.backlight 5
	}

	$devs | where type != monitor | each {|dev|
		set_brightness $dev.backlight 0
	}
}
