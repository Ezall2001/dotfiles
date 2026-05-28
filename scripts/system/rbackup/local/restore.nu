use ../consts.nu [LOCAL_REMOTE CONFIG_PATH]
use ../utils.nu [get_filters]
use ./confirm.nu [main]

def restore [backup_dir:string no_delete:bool] {
	let op = if $no_delete {'copy'} else {'sync'}

	get_filters | run-external ...[
		doas rclone $op
		($LOCAL_REMOTE):($backup_dir) ($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--metadata
		--no-update-modtime
		--no-update-dir-modtime
		--create-empty-src-dirs
		--filter-from -
	]
}

export def main [backup_dir:string --no-delete] {
	let is_confirmed = confirm $backup_dir true
	if not $is_confirmed {return}
	restore $backup_dir $no_delete
}
