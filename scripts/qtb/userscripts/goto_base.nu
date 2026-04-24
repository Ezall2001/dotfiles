use ../utils.nu [userscript_write]

export def main [new_tab:bool] {
	let base_url = $env.QUTE_URL | url parse
	| $"($in.scheme)://($in.host):($in.port)"

	let cmd = if $new_tab {
		$'open -r -t ($base_url)'
	} else {
		$'open ($base_url)'
	}

	userscript_write $cmd
}
