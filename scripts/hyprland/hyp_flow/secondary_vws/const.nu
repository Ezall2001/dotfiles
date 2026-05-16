use ../../consts.nu [SCREEN_GAP]

export const BINDS = [
	{
		events_keys:['alt-p']
		action:'transform[hyp_flow secondary_vws _action push_pull {4}]'
	}
	{
		events_keys:['alt-m']
		action:'transform[hyp_flow secondary_vws _action make_primary {4}]'
	}
]



export const CMD = [hyp_flow secondary_vws _input]

const SIZE = [600 400]
export const HYP_MENU_PARAMS = {
	size: $SIZE
	pos: [
		$'monitor_w-($SIZE.0)-($SCREEN_GAP)'
		$'monitor_h-($SIZE.1)-($SCREEN_GAP)'
	]
}
