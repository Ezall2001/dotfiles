const FILE_PATH = '/home/armen/.local/share/nushell/vendor/autoload/starship.nu'

def cleanup [] {
	rm $FILE_PATH
}

def setup [] {
	starship init nu | save -f $FILE_PATH
}

export def main [] {
	{
		name: starship
		actions: {
			cleanup: {cleanup}
			setup: {setup}
		}
	}
}
