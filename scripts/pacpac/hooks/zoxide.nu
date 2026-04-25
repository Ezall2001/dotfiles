const FILE_PATH = '/home/armen/.local/share/nushell/vendor/autoload/zoxide.nu'

def cleanup [] {
	rm $FILE_PATH
}

def setup [] {
	zoxide init nushell --cmd 'cd'
	| save -f $FILE_PATH
}

export def main [] {
	{
		name: zoxide
		actions: {
			cleanup: {cleanup}
			setup: {setup}
		}
	}
}
