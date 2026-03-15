use ../hyp_menu [main]
use ./validate.nu [main]
use ./consts.nu [SPF_TMP_FILE CACHE_PATH SOCKET DEFAULT_CACHE HYP_MENU_PARAMS]


export def _spf [dir:string]: nothing -> nothing {
	spf --cf $SPF_TMP_FILE $dir

	let selected = open $SPF_TMP_FILE
	'' | save -f $SPF_TMP_FILE

	let res = {
		selected: $selected
		last_dir: '~'
	}

	$res | to nuon | socat - UNIX-CONNECT:($SOCKET)
}

export def _main [--multi (-m), --dir (-d)] {
	let cache = try {
		open $CACHE_PATH | from json
	} catch { $DEFAULT_CACHE }

	hyp_menu [hyp_file_select _spf $cache.last_dir] 'spf' $HYP_MENU_PARAMS

	let res = socat UNIX-LISTEN:($SOCKET) - | from nuon
	let selected = $res.selected | lines

	let cache = $cache | merge {last_dir: $res.last_dir}
	$cache | save -f $CACHE_PATH

	if (validate $multi $dir $selected) {
		return $res.selected
	} else {return ''}

}

export def main [--multi (-m), --dir (-d)] {
	_main --multi=$multi --dir=$dir
}
