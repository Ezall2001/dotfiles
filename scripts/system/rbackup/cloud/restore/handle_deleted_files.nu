use ../../consts.nu [
	CLOUD_REMOTE CONFIG_PATH PORTED_META_DELETED_FILES_PATH
]

export def get_deleted_files [backup_dir:string no_delete:bool] {
	if $no_delete {return ''}

	let path = $backup_dir + $PORTED_META_DELETED_FILES_PATH
	rclone cat --config $CONFIG_PATH ($CLOUD_REMOTE):($path)
	| lines | where ($it | path exists)
}

export def apply_deletes [deleted_files:list<string>] {
	if ($deleted_files | is-empty) {return}
	$deleted_files | doas gtrash put ...$in
}
