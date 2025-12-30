use ../../../killp [killp]
use ../../hyp_init/init_waybar.nu [main]

def reload [] {
	killp --all --force waybar
	init_waybar
}

export def main [] {
	{
		name: 'reload waybar'
		exec: {reload}
	}
}
