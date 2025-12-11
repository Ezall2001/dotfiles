export def main [name:string, start_path:string, --dir (-d)]: [
	nothing -> string,
	nothing -> nothing,
] {
	mut path = $start_path | path expand
	let type = if $dir {'dir'} else {'file'}

	while $path != '/' {
		let _path = $path | path join $name

		if ($_path | path exists) and (($_path | path type) == $type) {
			return $_path
		}

		$path = $path | path dirname
	}

	return null
}
