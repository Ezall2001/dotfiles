export const META_SUM_PATH = '~/.local/state/rbackup/sum' | path expand
export const PORTED_META_DELETED_FILES_PATH = '/tmp/rbackup/deleted_files'

export const TMP_DIR = '/tmp/rbackup'
export const DIFF_PATH = '/tmp/rbackup/diff'


export const CONFIG_PATH = '~/.config/rclone/rclone.conf' | path expand
export const LOCAL_REMOTE = 'backup'
export const CLOUD_REMOTE = 'backup'

export const BACKED_DIRS = [/home/armen/personal/tmp/rclone_test]
export const IGNORED_DIRS = [
	**/node_modules/**
	**/__pycache_/**
	**/.venv/**
	**/.next/**
	**/built/**
	**/dist/**
	**/.nuxt/**
	**/.turbo/**
	**/.cache/**
	**/target/**
	**/.gradle/**
	**/.gradle/**
]
