use ../consts.nu [SCREEN_GAP]

export const CACHE_PATH = '~/.local/state/spf.json'
export const SOCKET = '/tmp/spf.sock'
export const SPF_TMP_FILE = '/tmp/spf'

export const DEFAULT_CACHE = {
	last_dir: ('~' | path expand)
}

const SIZE = [900 800]

export const HYP_MENU_PARAMS = {
	size: $SIZE
	pos: [
		$'monitor_w-($SIZE.0)-($SCREEN_GAP)'
		$'monitor_h-($SIZE.1)-($SCREEN_GAP)'
	]
}
