use ../consts.nu [EXPOSED_PATH]

export def main [] {
	'' | save -f $EXPOSED_PATH
}
