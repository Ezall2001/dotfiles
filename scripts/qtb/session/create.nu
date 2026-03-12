use ../consts.nu [
	session_base_dir
	SHARED_DATA_DIR SHARED_CACHE_DIR
	SHARED_CONFIG_DIR
]
use ./start.nu [main]

export def main [session:string, --open (-o)] {
	let base_dir = session_base_dir $session

	if ($base_dir | path exists) {
		print 'session exists'
		return
	}

	mkdir $base_dir

	ln -s $SHARED_CACHE_DIR $base_dir
	ln -s $SHARED_DATA_DIR $base_dir
	ln -s $SHARED_CONFIG_DIR $base_dir

	if $open {start $session}
}
