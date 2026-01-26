export def from_pct []: string -> oneof<int,float> {
	let val = $in | parse '{val}%' | first | get val
	if ($val | str contains '.') {$val | into float} else {$val | into int}
}

export def into_pct []: oneof<int,float> -> string {
	$'($in)%'
}
