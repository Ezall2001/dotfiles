use ../generators/copy.nu [main]

export def main [] {
	{
		name: rclone
		gens: [
			{
				src: ~/.config/rclone/rclone.conf.temp
				dst: ~/.config/rclone/rclone.conf
				gen: {|spec| copy $spec}
			}
		]
	}
}
