use ../hyp_flow [focus]
use ../hyp_setups [get_setup]

export def main [] {
	let setup = get_setup
	let mons = $setup.monitors | reverse

	for mon in $mons {
		focus $mon.init_focus primary
	}
}
