use ../../utils/col_rule.nu [make_col_priority_rule]

const devices = [ ]

const monitors = [
	{name:'HDMI-A-1' init_focus:0 backlight:ddci2}
	{name:'LVDS-1' init_focus:1 backlight:intel_backlight}
]

export def main [] {

	let list = [
		{
			tags: [terminal]
			exclude: [rmpc]
			col_rule: (make_col_priority_rule [0 1])
		}
		{
			tags: [llm]
			exclude: []
			col_rule: (make_col_priority_rule [1 0])
		}
		{
			tags: [browser]
			exclude: [qtb_llm]
			col_rule: (make_col_priority_rule [0 1])
		}
		{
			tags: [game media_editor]
			exclude: []
			col_rule: (make_col_priority_rule [0 1])
		}
		{
			tags: [music]
			exclude: []
			col_rule: (make_col_priority_rule [1 0])
		}
		{
			tags: [notes]
			exclude: []
			col_rule: (make_col_priority_rule [0 1])
		}
	]

	{
		name: 'four_walls'
		monitors: $monitors
		devices: $devices
		primary_vws_list: $list
	}
}
