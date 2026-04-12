use ../consts.nu [LOCAL_REMOTE CONFIG_PATH]
use ../check_root.nu [main]
use ./confirm.nu [main]
use ../utils.nu [get_includes]

def restore [backup_dir:string no_delete:bool] {
	let op = if $no_delete {'copy'} else {'sync'}
	let cmd = [
		rclone $op
		($LOCAL_REMOTE):($backup_dir) ($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--metadata
		--no-update-modtime
		--no-update-dir-modtime
		--create-empty-src-dirs
		...(get_includes)
	]
	run-external ...$cmd
}

export def main [backup_dir:string --no-delete] {
	check_root
	let is_confirmed = confirm $backup_dir true
	if not $is_confirmed {return}
	restore $backup_dir $no_delete
}
