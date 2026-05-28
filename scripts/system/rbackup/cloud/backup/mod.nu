use ../../consts.nu [CONFIG_PATH CLOUD_REMOTE LOCAL_REMOTE]
use ./get_filters.nu [get_cloud_backup_filters]
use ./handle_deleted_files.nu [save_deleted_files]


export def main [backup_dir:string] {
	save_deleted_files

	get_cloud_backup_filters | run-external ...[
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
