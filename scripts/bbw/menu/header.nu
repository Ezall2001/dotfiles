use ../../sfzf [get_state build_action_header]
use fields.nu [FIELDS_MAP]

def get_components [state:record type:int] {
	let yanks = FIELDS_MAP | get ($type - 1)
	| enumerate | flatten | each {|field|
		let key = if $field.index == 9 {0} else {$field.index + 1}
		| into string

		{
			icon: '󰆏 ',
			label: $field.label,
			key: ($key)
		}
	}

	let sync = {
		icon: '󰓦 ',
		label: sync,
		key: r
	}

	$yanks ++ [$sync]

}

export def get_header [state?:oneof<record,nothing> item?:record] {
	if $item == null {return 'no item focused'}

	let state = $state | default (get_state)
	let components = get_components $state $item.type
	build_action_header $components
}
