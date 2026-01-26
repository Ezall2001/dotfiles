use ../hyp_lunch [main]
use ../hyp_utils [get_ws_name]

def get_params [row:int type=primary:string] {
	let ws_name = get_ws_name $row $type

	{
		ws:{name:$ws_name silent:true}
	}
}

export def main [] {
	hyp_lunch 'tmux' (get_params 0)
	hyp_lunch 'zen browser' (get_params 2)
	hyp_lunch 'rmpc' (get_params 4)
	hyp_lunch 'obsidian' (get_params 5)
}
