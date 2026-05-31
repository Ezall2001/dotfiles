use ./const.nu [LOCKSCREEN_PATH ASSETS_PATH]

export def main [path:string] {
	let path = $path | path expand

	rm -f $LOCKSCREEN_PATH
	mkdir $ASSETS_PATH
	ln -sT $path $LOCKSCREEN_PATH
}
