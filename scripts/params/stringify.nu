export def main [params:record] {
	$params
	| transpose key val
	| where val != null
	| each {|r|
		if ($r.val | describe) == bool {
			$'--($r.key)'
		} else {
			$'--($r.key)=($r.val)'
		}
	} | str join ' '
}
