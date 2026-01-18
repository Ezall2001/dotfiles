export def build_exec_rule [components:list<oneof<string,nothing>>]: nothing -> string {
	let inner = $components | where $it != null | str join '; '
	$'[($inner)]'
}
export def build_tag_exec_rule [tags:list<string> add=true:bool]: nothing -> string {
	let op = if $add {'+'} else {'-'}
	$tags | each {|t| $'tag ($op)($t)'}
}
