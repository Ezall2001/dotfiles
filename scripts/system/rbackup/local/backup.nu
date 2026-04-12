use ../consts.nu [LOCAL_REMOTE CONFIG_PATH SUM_PATH BACKED_DIRS]
use ../files.nu [get_system_files get_remote_files]
use ./confirm.nu [main]
use ../check_root.nu [main]
use ../utils.nu [get_includes]

def create_sum [] {
	print 'calculating sum'

	let cmd = [
		rclone md5sum
		($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--output-file $SUM_PATH
		...(get_includes)
	]
	run-external $cmd
}

def backup [backup_dir:string no_delete:bool] {
	let op = if $no_delete {'copy'} else {'sync'}
	let cmd = [
		rclone $op
		($LOCAL_REMOTE):/ ($LOCAL_REMOTE):($backup_dir)
		--config $CONFIG_PATH
		--progress
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
	if not (confirm $backup_dir) {return}
	backup $backup_dir $no_delete
	create_sum
}
