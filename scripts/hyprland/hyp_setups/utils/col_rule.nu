export def make_col_priority_rule [priority:list<int>]: nothing -> closure {
	{|setup|
		let mons = hyprctl monitors -j | from json | get name

		for p in $priority {

			let setup_mon = $setup.monitors
			| enumerate | flatten item | get $p

			if $setup_mon.name in $mons {
				return $setup_mon.index
			}
		}

		return null
	}
}
