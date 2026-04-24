use ../generators/copy.nu [main]

export def main [] {
	{
		name: ly
		gens: [
			{
				src: ~/.config/ly/ly_init
				dst: /etc/ly/ly_init
				gen: {|spec| copy $spec true}
			}
			{
				src: ~/.config/ly/config.ini
				dst: /etc/ly/config.ini
				gen: {|spec| copy $spec true}
			}
		]
	}
}
