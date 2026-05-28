use ../consts.nu [IGNORED_DIRS BACKED_DIRS LOCAL_REMOTE CONFIG_PATH META_SUM_PATH]
use ../utils.nu [get_filters]
use ./confirm.nu [main]

def create_sum [backup_dir:string] {
	print 'calculating sum'

	get_filters | run-external ...[
		doas rclone md5sum
		($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--output-file $META_SUM_PATH
		--filter-from -
	]
}

def backup [backup_dir:string no_delete:bool] {
	let op = if $no_delete {'copy'} else {'sync'}

	get_filters | run-external ...[
		doas rclone $op
		($LOCAL_REMOTE):/ ($LOCAL_REMOTE):($backup_dir)
		--config $CONFIG_PATH
		--progress
		--metadata
		--no-update-modtime
		--no-update-dir-modtime
		--create-empty-src-dirs
		--filter-from -
	]
}

export def main [backup_dir:string --no-delete] {
	if not (confirm $backup_dir) {return}
	backup $backup_dir $no_delete
	create_sum $backup_dir
}
