use ../../../sfzf [FZF_DELIMETER]
use ../../hyp_setups [get_backlight_devices]
use ../utils.nu [get_brightness]
use ../../../utype [into_pct]

def get_item [dev:record] {
	let brightness = get_brightness $dev.backlight
	if $brightness == null {return}
	let brightness = $brightness | into_pct

	[$dev.type $dev.name $brightness $dev.backlight]
	| str join $FZF_DELIMETER
}

export def get_input [] {
	get_backlight_devices | each {get_item $in}
	| str join "\n"
}
