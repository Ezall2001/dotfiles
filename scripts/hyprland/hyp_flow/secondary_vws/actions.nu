use ../../../sfzf [reload_input]
use ./controls.nu

export def make_primary [addr:string] {
	controls make_primary_vws $addr o> /dev/null
	reload_input
}

export def push_pull [addr:string] {
	controls push_pull $addr
	''
}
