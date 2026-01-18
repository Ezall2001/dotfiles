use ../consts.nu [MODIFIERS_MASK_MAP]

export def mod_mask_to_name [mask:oneof<int,string>] {
	let mask = $mask | into string

	try {
		$MODIFIERS_MASK_MAP | get $mask
	} catch {
		let e = $"mod mask \(($mask)\) not defined"
		notify-send -t 5000 -u CRITICAL $e
		null
	}
}
