use ./defs/four_walls [main]

def bind_col_rules [vws:record setup:record] {
	{ do $vws.col_rule $setup }
}

def augment [setup:record] {
	let list = $setup.primary_vws_list | enumerate
	| rename row item | flatten item
	| each {|vws|
		$vws | merge {col_rule: (bind_col_rules $vws $setup)}
	}

	let monitors = $setup.monitors | enumerate
	| rename col item | flatten item

	$setup | merge {
		monitors: $monitors
		primary_vws_list: $list
	}
}

export def main [] {
	four_walls | augment $in
}
