const CONFIG_PATH = '~/.config/tmux' | path expand

def install_tpm [] {
	print 'installing tpm (tmux plugins manager)'

	const repo = 'https://github.com/tmux-plugins/tpm'
	const path = $CONFIG_PATH | path join plugins tpm
	git clone $repo $path
}

export def main [] {
	{
		tasks: {
			install_tpm: {install_tpm}
		}
	}
}
