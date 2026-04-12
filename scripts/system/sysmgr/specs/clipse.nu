use ../utils.nu [mkdirs]

def _mkdirs [] {
	print 'making clipse dirs'

	mkdirs ...[
		~/.local/share/clipse
		~/.local/state/clipse
		~/.cache/clipse
	]
}

export def main [] {
	{
		tasks: {
			mkdirs: {_mkdirs}
		}
	}
}
