export def main [] {}

export def style [str:string ...styles] {
	let style = $styles | each {ansi $in} | str join ''
	$'($style)($str)(ansi rst)'
}
