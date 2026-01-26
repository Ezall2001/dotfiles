use ../utils.nu
use ../../../sfzf [reload_input]

export def set_brightness [name:string pct:int] {
	utils set_brightness $name $pct
	return (reload_input)
}
