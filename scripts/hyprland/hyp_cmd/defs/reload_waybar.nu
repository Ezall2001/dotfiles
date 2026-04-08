use ../../../nushell/nui
use ../../hyp_init [init_waybar]

def reload [] {
	nui kill --all --force waybar
	hyprctl dispatch exec hyp_cmd init_waybar
}

export def main [] {
	{
		name: 'reload waybar'
		exec: {reload}
	}
}
