def build_exec_rule [components:list<oneof<string,nothing>>]: nothing -> string {
	let inner = $components | where $it != null | str join '; '
	$'[($inner)]'
}

export def get_exec_rules [params:record] {
	let ws = if 'ws' in $params {
		let silent_str = if $params.ws.silent {' silent'} else {''}
		$'workspace ($params.ws.name)($silent_str)'
	}

	let tags = if 'tags' in $params {
		$params.tags | where $it.dynamic
		| each {|t| $'tag ($t.op)($t.tag)'}
	}

	let cps = [
		$ws ...$tags
	]

	build_exec_rule $cps
}

export def post_exec_rules [addr:string params:record] {
	if 'ws' in $params {
		let op = if $params.ws.silent {'movetoworkspacesilent'} else {'movetoworkspace'}
		hyprctl dispatch $op name:($params.ws.name), address:($addr)
	}

	if 'tags' in $params {
		$params.tags | where (not $it.dynamic)
		| each {hyprctl dispatch tagwindow ($in.op)($in.tag) address:($addr)}
	}

}
