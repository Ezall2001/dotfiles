use ../utils.nu [mkdirs]
use ../../../qtb/consts.nu [
	SHARED_DATA_DIR
	SHARED_CACHE_DIR
	SHARED_CONFIG_DIR
]

def _mkdirs [] {
	print 'making qtb dirs'

	mkdirs ...[
		$SHARED_DATA_DIR
		$SHARED_CACHE_DIR
		$SHARED_CONFIG_DIR
	]
}

export def main [] {
	{
		tasks: {
			mkdirs: {_mkdirs}
		}
	}
}
