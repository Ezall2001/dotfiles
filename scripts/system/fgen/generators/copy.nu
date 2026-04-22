export def main [spec:record as_root:bool=false] {
	let is_dir = $spec.src | path type | $in == dir
	let recursive = if $is_dir {'-r'} else {null}
	let doas = if $as_root {'doas'} else {null}

	let cmd = [
		$doas
		cp
		$recursive
		$spec.src
		$spec.dst
	] | where $it != null

	print $cmd
	run-external $cmd
}
