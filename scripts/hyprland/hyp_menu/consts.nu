use ../consts.nu [SCREEN_GAP]

export const DEFAULT_PARAMS = {
	size: [500 700]
	pos: [
		$'monitor_w-window_w-($SCREEN_GAP)'
		$'monitor_h-window_h-($SCREEN_GAP)'
	]
}
