use ../consts.nu [SCREEN_GAP]

const SIZE = [600 700]

export const HYP_MENU_PARAMS = {
	size: $SIZE
	pos: [
		$'monitor_w-($SIZE.0)-($SCREEN_GAP)'
		$'monitor_h-($SIZE.1)-($SCREEN_GAP)'
	]
}
