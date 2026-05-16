use ../../fgen [main]

const CONFIG_LINK = '~/.config' | path expand
const CONFIG_PATH = '~/personal/dotfiles' | path expand

def mklinks [] {
	if not ($CONFIG_LINK | path exists) {
		print 'linking dotconfig to ~/.config'
		ln -s $CONFIG_PATH $CONFIG_LINK
	}
}

def gen [] {
	fgen scripts
}

def prepare [] {
	print 'seting up node dependencies'

	cd $CONFIG_PATH
	^pnpm install
	^pnpm approve-builds
	^pnpm prepare
}


export def main [] {
	{
		tasks: {
			mklinks: {mklinks}
			gen: {gen}
			prepare: {prepare}
		}
	}
}
