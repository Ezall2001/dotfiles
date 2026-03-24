export const BASE_DIR = "~/.local/share/qutebrowser" | path expand
export const DOT_CONFIG_DIR = "~/.config/qutebrowser" | path expand

export const SHARED_DIR = $BASE_DIR | path join "shared_data"
export const SHARED_CACHE_DIR = $SHARED_DIR | path join "cache"
export const SHARED_DATA_DIR = $SHARED_DIR | path join "data"
export const SHARED_CONFIG_DIR = $SHARED_DIR | path join "config"
export const CONFIG_ENTRY = $DOT_CONFIG_DIR | path join 'config.py'

export def session_base_dir [session:string] {
	$BASE_DIR | path join $session
}

export def session_file [session:string] {
	$SHARED_DATA_DIR | path join 'sessions' $'($session).yml'
}
