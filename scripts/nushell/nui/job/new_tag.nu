use ./consts.nu [TAG_SEPERATOR]

export def main [name:string] {
	let msg_tag = date now | format date "%H%M%S%f"
	let tag =	$"($name)($TAG_SEPERATOR)($msg_tag)"
	$tag
}
