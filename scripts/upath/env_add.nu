export def --env main [path: string] {
	let path = $path | path expand
	$env.PATH ++= [$path]
	return
}
