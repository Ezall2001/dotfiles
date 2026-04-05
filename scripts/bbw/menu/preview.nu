use ../consts.nu [BASE_URL]

export def main [item:string] {
	$item | from json | to toml
}
