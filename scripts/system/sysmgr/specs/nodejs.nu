const PATHS = [
	~/.config/scripts/nushell/nui/str/wrap
]

def install [] {
	$PATHS | each {|p|
		print ('installing nodejs project: ' + $p)
		cd $p
		pnpm install
	}
}

export def main [] {
	{
		tasks: {
			install: {install}
		}
	}
}
