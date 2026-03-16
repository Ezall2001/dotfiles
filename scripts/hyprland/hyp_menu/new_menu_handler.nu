use ../hyp_utils [parse_math_expression]

def get_win_rule [params:record] {
	let size_str = $params.size | str join ' '
	let pos_str = $params.pos | each {'(' + $in + ')'} | str join ' '
	$'[float; size ($size_str); move ($pos_str)]'
}

def get_pos_str [params:record window:record mon:string] {
	let x = parse_math_expression $params.pos.0 $window.address $mon
	let y = parse_math_expression $params.pos.1 $window.address $mon

	[$x $y] | str join ' '
}

export def main [cmd:list<string> title:string params:record] {
	let cmd = $cmd | str join ' '
	let winrule = get_win_rule $params

	hyprctl dispatch -- exec ($winrule) $'ghostty --title=($title) -e ($cmd)' | ignore

}
