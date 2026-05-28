use ../consts.nu [DIFF_PATH LOCAL_REMOTE CONFIG_PATH TMP_DIR]
use ../utils.nu [print_diff get_filters]

export def main [backup_dir:string switch_direction:bool=false] {
	let dir = if $switch_direction {
		[($LOCAL_REMOTE):($backup_dir) ($LOCAL_REMOTE):/]
	} else {
		[($LOCAL_REMOTE):/ ($LOCAL_REMOTE):($backup_dir)]
	}

	mkdir $TMP_DIR
	let cmd = [
		doas rclone check
		...$dir
		--config $CONFIG_PATH
		--combined $DIFF_PATH
		--filter-from -
	]


	try {
		get_filters | run-external ...$cmd e+o> /dev/null
	}

	print_diff

	let confirmation = input --numchar 1 'confirm (y/N): '
	| str downcase

	$confirmation == y
}
