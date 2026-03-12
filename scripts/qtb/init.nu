use ./consts.nu [
	SHARED_DIR
	SHARED_CONFIG_DIR
	SHARED_CACHE_DIR
	SHARED_DATA_DIR
]

export def main [] {
	mkdir $SHARED_DIR
	mkdir $SHARED_CACHE_DIR
	mkdir $SHARED_DATA_DIR
	mkdir $SHARED_CONFIG_DIR
}
