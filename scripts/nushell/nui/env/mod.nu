export def --env add_path [path: string] {
	let path = $path | path expand
	$env.PATH ++= [$path]
	return
}
