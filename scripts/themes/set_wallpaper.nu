use ./const.nu [WALLPAPER_PATH ASSETS_PATH]

export def main [path:string] {
	let path = $path | path expand

	rm -f $WALLPAPER_PATH
	mkdir $ASSETS_PATH
	ln -sT $path $WALLPAPER_PATH

	hyprctl monitors -j | from json | get name | each {|mon|
		hyprctl hyprpaper wallpaper $'($mon),($WALLPAPER_PATH)'
	}
}
