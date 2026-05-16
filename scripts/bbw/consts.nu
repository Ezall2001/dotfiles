use ../hyprland/consts.nu [SCREEN_GAP]

export const EXPOSED_PATH = '~/.local/share/bitwarden/exposed' | path expand
export const STATE_PATH = '~/.local/state/bitwarden/state.json' | path expand
export const PORT = 8087
export const BASE_URL = $'http://localhost:($PORT)'

export def DEFAULT_STATE [] {
	{
		last_check: ((date now) - 1wk)
		ignore_exposed: []
	}
}

const SIZE = [1000 700]

export const PARAMS = {
	size: $SIZE
	pos: [
		$'monitor_w-($SIZE.0)-($SCREEN_GAP)'
		$'monitor_h-($SIZE.1)-($SCREEN_GAP)'
	]
}
