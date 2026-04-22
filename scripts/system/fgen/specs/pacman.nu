use ../generators/copy.nu [main]

export def main [] {
	{
		name: pacman
		src: ~/.config/pacman/pacman.conf
		dst: /etc/pacman.conf
		gen: {|spec| copy $spec true}
	}
}
