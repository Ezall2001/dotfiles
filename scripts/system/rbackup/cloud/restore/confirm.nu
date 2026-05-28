use ../../consts.nu [
	CLOUD_REMOTE LOCAL_REMOTE DIFF_PATH CONFIG_PATH
]
use ../../utils.nu [print_diff]
use ../../../../nushell/nui

export def main [backup_dir:string deleted_files:list<string>] {
	let cmd = [
		doas rclone check
		($CLOUD_REMOTE):($backup_dir) ($LOCAL_REMOTE):/
		--config $CONFIG_PATH
		--combined $DIFF_PATH
		--one-way
	]

	'' | nui save -f $DIFF_PATH
	try {run-external ...$cmd e+o> /dev/null}

	$deleted_files | par-each {|f|
		$f | str substring 1.. | '- ' + $in
	} | str join "\n" | save -a $DIFF_PATH

	print_diff

	let confirmation = input --numchar 1 'confirm (y/N): '
	| str downcase

	$confirmation == y
}
