use consts.nu [BACKED_DIRS CONFIG_PATH]

export def get_system_files [] {
	run-external ...[
		fd
		--hidden
		--type file --type symlink --type dir
		--absolute-path
		. ...$BACKED_DIRS
	]
	| lines | ls -D ...$in
	| update name {|row|
		if $row.type == symlink {
			$row.name + '.rclonelink'
		} else { $row.name }
	}
	| get name
}

export def get_remote_files [remote:string backup_dir:string] {
	run-external ...[
		rclone lsjson
		--recursive
		--config $CONFIG_PATH
		($remote):($backup_dir)
	]
	| from json | get Path
	| each {'/' + $in}
}
