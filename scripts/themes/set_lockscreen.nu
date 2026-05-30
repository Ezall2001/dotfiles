use ./const.nu [LOCKSCREEN_PATH]

export def main [path:string] {
	let path = $path | path expand

	rm $LOCKSCREEN_PATH
	ln -sT $path $LOCKSCREEN_PATH
}
