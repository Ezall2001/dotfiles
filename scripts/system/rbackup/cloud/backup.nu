use ../consts.nu [SUM_PATH DIFF_PATH CONFIG_PATH CLOUD_REMOTE LOCAL_REMOTE DELETED_FILES_PATH BACKED_DIRS]
use ../check_root.nu [main]
use ../../../nushell/nui
use ../utils.nu [get_includes]

def get_exclude_filters [] {
	let cmd = [
		rclone md5sum
		($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--checkfile $SUM_PATH
		...(get_includes)
	]

	'' | nui save -f $DIFF_PATH
	try {run-external ...$cmd o> $DIFF_PATH e> /dev/null}

	open $DIFF_PATH | lines
	| where ($it | str starts-with '=')
	| par-each {$in | str replace '=' '-' }
}

def get_include_filters [] {
	$BACKED_DIRS | each {$'+ ($in)/**'}
	| append $'+ ($DELETED_FILES_PATH)'
}

def get_deleted_files [] {
	open $SUM_PATH | str replace -a '.rclonelink' ''
	| lines | par-each {
	$in | split row '  ' | get 1 | '/' + $in
	} | where not ($it | path exists)
}

export def main [backup_dir:string] {
	check_root

	get_deleted_files | str join "\n"
	| nui save -f $DELETED_FILES_PATH

	let excludes = get_exclude_filters
	let includes = get_include_filters
	let filters = ($excludes ++ $includes ++ ['- /**'])
	| str join "\n"

	$filters | run-external ...[
		rclone sync
		($LOCAL_REMOTE):/ ($CLOUD_REMOTE):($backup_dir)
		--config $CONFIG_PATH
		--metadata
		--no-update-modtime
		--no-update-dir-modtime
		--filter-from -
		--fast-list
		--delete-excluded
		--create-empty-src-dirs
	]
}
