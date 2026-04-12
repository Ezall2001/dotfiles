export def main [spec:record] {
	let is_dir = $spec.src | path type | $in == dir
	let recursive = if $is_dir {'-r'} else {''}

	let cmd = [
		cp
		$recursive
		$spec.src
		$spec.dst
	]

	run-external $cmd
}
