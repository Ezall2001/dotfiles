use ../consts.nu [CLOUD_REMOTE LOCAL_REMOTE DIFF_PATH CONFIG_PATH SUM_PATH DELETED_FILES_PATH CLOUD_LINKS_PATH]
use ../../../nushell/nui
use ../check_root.nu [main]
use ../utils.nu [print_diff]

def get_deleted_files [backup_dir:string no_delete:bool] {
	if $no_delete {return ''}
	let path = $backup_dir
	| path join ($DELETED_FILES_PATH | str substring 1..)
	rclone cat --config $CONFIG_PATH ($CLOUD_REMOTE):($path)
	| lines | where ($it | path exists)
}

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

	if ($deleted_files | is-empty) {return}
	$deleted_files | gtrash put ...$in
}

def confirm [backup_dir:string deleted_files:list<string>] {
	let cmd = [
		rclone check
		($CLOUD_REMOTE):($backup_dir) ($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--combined $DIFF_PATH
		--one-way
	]

	try {run-external ...$cmd e+o> /dev/null}

	$deleted_files | par-each {|f|
		$f | str substring 1.. | '- ' + $in
	} | str join "\n" | save -a $DIFF_PATH

	print_diff

	let confirmation = input --numchar 1 'confirm (y/N): '
	| str downcase

	$confirmation == y
}

def warning [] {
	open $DIFF_PATH | lines
	| where ($it | str ends-with '.rclonelink')
	| str join "\n" | nui save -f $CLOUD_LINKS_PATH

	print 'REMINDER: links backed in the cloud loses their metadata !'
	print $'restored links list is written to ($CLOUD_LINKS_PATH)'
}

export def main [backup_dir:string --no-delete] {
	check_root
	let deleted_files = get_deleted_files $backup_dir $no_delete
	let is_confirmed = confirm $backup_dir $deleted_files
	if not ($is_confirmed) {return}
	restore $backup_dir $deleted_files
	warning
}
