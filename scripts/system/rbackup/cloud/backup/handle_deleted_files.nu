use ../../../../nushell/nui
use ../../consts.nu [
	META_SUM_PATH PORTED_META_DELETED_FILES_PATH TMP_DIR
]

export def save_deleted_files [] {
	open $META_SUM_PATH | str replace -a '.rclonelink' ''
	| lines | par-each {
		split row '  ' | get 1 | '/' + $in
	}
	| where not ($it | path exists)
	| str join "\n"
	| nui save -f $PORTED_META_DELETED_FILES_PATH
}
