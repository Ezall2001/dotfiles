export def monitor_scaled_size [mon:record] {
	let aug = {
		scaled_w: ($mon.width / $mon.scale)
		scaled_h: ($mon.height / $mon.scale)
	}

	$mon | merge $aug
}
