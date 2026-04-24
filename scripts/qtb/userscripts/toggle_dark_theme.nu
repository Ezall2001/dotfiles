use ../utils.nu [userscript_write]

export def main [] {
	let url_pattern = $env.QUTE_URL | url parse
	| $"*://($in.host)/*"

	let cmd = $'config-cycle --pattern ($url_pattern) colors.webpage.darkmode.enabled true false'

	userscript_write [
		$cmd
		reload
	]
}
