use ../../consts.nu [
	CLOUD_REMOTE LOCAL_REMOTE DIFF_PATH CONFIG_PATH
	META_SUM_PATH PORTED_META_DELETED_FILES_PATH
]
use ./handle_deleted_files.nu [get_deleted_files apply_deletes]
use ./confirm.nu [main]

def restore [backup_dir:string deleted_files:list<string>] {
	run-external ...[
		rclone copy
		($CLOUD_REMOTE):($backup_dir) ($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--metadata
		--no-update-modtime
		--no-update-dir-modtime
		--create-empty-src-dirs
		--fast-list
	] e> /dev/null

	apply_deletes $deleted_files
}

export def main [backup_dir:string --no-delete] {
	let deleted_files = get_deleted_files $backup_dir $no_delete
	let is_confirmed = confirm $backup_dir $deleted_files
	if not ($is_confirmed) {return}
	restore $backup_dir $deleted_files
}
