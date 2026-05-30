use ./const.nu [CURSOR_DIR CURSOR_SIZE CURSOR_THEME_DIR]

# NOTE: the first setcursor is need since hyprctl only
# reload the cursor when there is a filename change
# and default_cursor is a symbolic link

def themes [] {
	ls -s $CURSOR_THEME_DIR | get name
}

export def main [name:string@themes] {
	let path = $CURSOR_THEME_DIR | path join $name
	rm -rf $CURSOR_DIR
	ln -s $path $CURSOR_DIR

	hyprctl setcursor noop $CURSOR_SIZE | ignore
	hyprctl setcursor default_cursor $CURSOR_SIZE | ignore
}
