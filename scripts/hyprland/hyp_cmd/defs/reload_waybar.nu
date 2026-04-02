use ../../../killp [killp]
use ../../hyp_init [init_waybar]
use ../../../uschedule [wait_until]

def reload [] {
	killp --all --force waybar
	hyprctl dispatch exec hyp_cmd init_waybar
}

export def main [] {
	{
		name: 'reload waybar'
		exec: {reload}
	}
}
