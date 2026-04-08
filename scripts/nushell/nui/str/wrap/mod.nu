const path = '~/.config/scripts/nushell/nui/str/wrap/src/index.js' | path expand


export def _main [text:string width:int] {
	let cmd = [node $path $text $width]
	run-external ...$cmd
}

export def main [text:string width:int] {_main $text $width}
