use ../hyp_backlight [set_brightness]
use ../hyp_setups [get_backlight_devices]

use ./consts.nu [CACHE_FILE]

export def main [] {
	let devs = get_backlight_devices
	let cache = open $CACHE_FILE

	$devs | where type == monitor | each {|dev|
		hyprctl dispatch dpms on ($dev.name)
	}

	$devs | each {|dev|
		let cache_dev = $cache | where backlight == $dev.backlight | first
		if $cache_dev == null or $cache_dev.brightness == null {return}
		set_brightness $dev.backlight $cache_dev.brightness
	}
}
