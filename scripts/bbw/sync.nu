use consts.nu [BASE_URL]

export def main [] {
	http post $'($BASE_URL)/sync' ''
}
