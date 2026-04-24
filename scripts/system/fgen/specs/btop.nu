use ../generators/copy.nu [main]

export def main [] {
	{
		name: btop
		gens: [
			{
				src: ~/.config/btop/btop.conf.tmpl
				dst: ~/.config/btop/btop.conf
				gen: {|spec| copy $spec}
			}
		]
	}
}
