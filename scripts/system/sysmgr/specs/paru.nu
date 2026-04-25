use ../../../pacpac

def install_packages [] {
	print 'installing paru packages from lockfile'
	pacpac lockfile install
}

def install [] {
	print 'installing paru'

	git clone https://aur.archlinux.org/paru.git /tmp/paru
	cd /tmp/paru
	makepkg -si
}

export def main [] {
	{
		tasks: {
			install: {install}
			install_packages: {install_packages}
		}
	}
}
