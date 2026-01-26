use ./get_setup.nu [main]

export def main [] {
	let setup = get_setup

	let monitors = $setup.monitors | insert type monitor
	let other = $setup.devices | where backlight != null
	$monitors ++ $other
}
