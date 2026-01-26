use ../sfzf [get_state]
use const.nu [DELIMITER]
use ../preview

def preview_group [paths:string trash_paths:string cols:int] {
	let paths = $paths | split row $DELIMITER
	let trash_paths = $trash_paths | split row $DELIMITER

	let tbl = $paths | zip $trash_paths | each {{path: $in.0 trash_path: $in.1}}
	let dirs = $tbl | where ($it.trash_path | path type) == dir
	let files = $tbl | where ($it.trash_path | path type) == file

	if not ($dirs | is-empty) {
		let dirs = $dirs | get path | wrap 'Directories' |
		table --width $cols | nu-highlight

		print ($dirs)
	}

	if not ($files | is-empty) {
		let files = $files | get trash_path
		bat $'--terminal-width=($cols)' '--color=always' ...$files
	}
}

export def _preview [path:string trash_path:string] {
	if $path == '' {return}

	let state = get_state

	let cols = $env.FZF_PREVIEW_COLUMNS | into int
	let rows = $env.FZF_PREVIEW_LINES | into int

	if $state.group {
		preview_group $path $trash_path $cols
	} else {
		preview path $trash_path --cols $cols --rows $rows
	}

}
