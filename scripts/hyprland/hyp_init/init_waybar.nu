use ../hyp_setups [get_setup]

const config_dir = '~/.config/waybar' | path expand

export def main [] {
	let hyp_mons = hyprctl monitors -j | from json | get name
	let mons = get_setup | get monitors
	| where ($it.name in $hyp_mons)

	for mon in $mons {
		let path = $config_dir | path join $'mon_($mon.col)/config.jsonc'
		hyprctl dispatch -- exec $'waybar --config ($path)' | ignore
	}
}
