def does_belong [tags:list<string> vws:record] {
	let is_excluded = $tags | where $it in $vws.exclude
	| length | $in > 0

	if $is_excluded {return false}

	$tags | where $it in $vws.tags
	| length | $in > 0
}

export def main [tags:list<string> setup:record]: nothing -> oneof<int,nothing> {
	let vws = $setup.primary_vws_list
	| where (does_belong $tags $it)
	| first

	if $vws == null {null} else {$vws.row}
}
