use ./consts.nu [DEFAULT_STATE STATE_PATH DCONF_PATH MESSAGE DUMP_PATH]
use ../nushell/nui
use ../ggit [BOT_AUTHOR]

export def commit [] {
	let state = try {open $STATE_PATH} catch {$DEFAULT_STATE}
	let hash = md5sum $DCONF_PATH | split words | first

	if $state.hash == $hash { return }

	$state | merge {hash: $hash} | to json
	| nui save -f $STATE_PATH

	dconf dump / | nui save -f $DUMP_PATH
	git commit --only $DUMP_PATH -m ($MESSAGE) --author $BOT_AUTHOR
}

export def restore [] {
	if not ($DUMP_PATH | path exists) { return }
	open $DUMP_PATH | dconf load /
}

export def main [] { }
