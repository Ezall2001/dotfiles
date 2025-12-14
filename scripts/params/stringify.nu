export def main [params:record, --join (-j)] {
	let _params = $params
	| transpose key val
	| where val != null
	| each {|r|
		if ($r.val | describe) == bool {
			$'--($r.key)'
		} else {
			$'--($r.key)=($r.val)'
		}
	}

	if $join {$_params | str join ' '} else {$_params}
}
