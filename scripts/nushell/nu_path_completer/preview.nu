use ../../preview
use output.nu [get_output]
use ../../sfzf [get_state]
use consts.nu [STARTS]


export def main [path: string] {
	let state = get_state
	let start = $STARTS | get $state.start | path expand

	let abs_path = $start | path join $path
	preview path $abs_path --cols $env.FZF_PREVIEW_COLUMNS --rows $env.FZF_PREVIEW_LINES
}
