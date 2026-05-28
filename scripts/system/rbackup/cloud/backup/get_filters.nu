use ../../consts.nu [
	META_SUM_PATH DIFF_PATH CONFIG_PATH
	LOCAL_REMOTE PORTED_META_DELETED_FILES_PATH BACKED_DIRS
	IGNORED_DIRS TMP_DIR
]
use ../../utils.nu [get_filters]
use ../../../../nushell/nui

def get_exclude_filters [] {
	let cmd = [
		doas rclone md5sum
		($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--checkfile $META_SUM_PATH
		--filter-from -
	]

	'' | nui save -f $DIFF_PATH
	try {
		get_filters | run-external ...$cmd o> $DIFF_PATH e> /dev/null
	}

	let unchanged = open $DIFF_PATH | lines
	| where ($it | str starts-with '=')
	| par-each {$in | str replace '=' '-' }
	let ignored = $IGNORED_DIRS | each {$'- ($in)'}

	$unchanged ++ $ignored
}

def get_include_filters [] {
	$BACKED_DIRS | each {$'+ ($in)/**'}
	| append $'+ ($PORTED_META_DELETED_FILES_PATH)'
}

export def get_cloud_backup_filters [] {
	let excludes = get_exclude_filters
	let includes = get_include_filters
	($excludes ++ $includes ++ ['- /**'])
	| str join "\n"
}
