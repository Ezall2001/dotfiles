use ../consts.nu [SCREEN_GAP]

export const DEFAULT_SIZE = [500 700]

export const DEFAULT_PARAMS = {
	size: $DEFAULT_SIZE
	pos: [
		$'monitor_w-($DEFAULT_SIZE.0)-($SCREEN_GAP)'
		$'monitor_h-($DEFAULT_SIZE.1)-($SCREEN_GAP)'
	]
}
