use specs [main]

def name_comp [] {
	specs | get name
}

export def _main [name:string callback?:closure --watch(-w)] {
	let spec = specs | where name == $name | first
	if $spec == null {
		print "can't find spec"
		return
	}

	# NOTE: wrapped for lazy evaluation
	let callback = $callback | default { ({ null }) }

	do $spec.gen $spec
	do $callback

	if $watch {
		watch $spec.src {
			do $spec.gen $spec
			do $callback
		}
	}
}

export def main [name:string@name_comp callback?:closure --watch(-w)] {
	_main $name $callback --watch=$watch
}
