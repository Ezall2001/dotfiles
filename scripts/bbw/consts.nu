export const EXPOSED_PATH = '~/.local/share/bitwarden/exposed' | path expand
export const STATE_PATH = '~/.local/state/bitwarden/state.json' | path expand
export const PORT = 8087
export const BASE_URL = $'http://localhost:($PORT)'

export def DEFAULT_STATE [] {
	{
		last_check: ((date now) - 1wk)
	}
}

export const PARAMS = {
	size: [1000 700]
}
