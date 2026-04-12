use ../consts.nu [DIFF_PATH LOCAL_REMOTE CONFIG_PATH TMP_DIR BACKED_DIRS]
use ../utils.nu [get_includes print_diff]

export def main [backup_dir:string switch_direction:bool=false] {
	let dir = if $switch_direction {
		[($LOCAL_REMOTE):($backup_dir) ($LOCAL_REMOTE):/]
	} else {
		[($LOCAL_REMOTE):/ ($LOCAL_REMOTE):($backup_dir)]
	}

	mkdir $TMP_DIR
	let cmd = [
		rclone check
		...$dir
		--config $CONFIG_PATH
		--combined $DIFF_PATH
		...(get_includes)
	]

	try {run-external ...$cmd e+o> /dev/null}

	print_diff

	let confirmation = input --numchar 1 'confirm (y/N): '
	| str downcase

	$confirmation == y
}
