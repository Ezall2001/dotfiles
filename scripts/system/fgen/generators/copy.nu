export def main [gen:record as_root:bool=false] {
	let is_dir = $gen.src | path type | $in == dir
	let recursive = if $is_dir {'-r'} else {null}
	let doas = if $as_root {'doas'} else {null}

	let cmd = [
		$doas
		cp
		$recursive
		$gen.src
		$gen.dst
	] | where $it != null

	run-external $cmd
}
