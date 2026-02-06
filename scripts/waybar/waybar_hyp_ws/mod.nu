use ./ui/text_ui.nu [main]
use ./get_vws_list [main]
use ../../hyprland/hyp_log [main]

export use ./refresh.nu [main]

export def _main [col:int] {
	let text = try {
		let vws_list = get_vws_list $col
		text_ui $vws_list
	} catch {|e|
		hyp_log $e.rendered waybar_hyp_ws --notify 'waybar_hyp_ws'	--level error
		'hyp_ws:error'
	}

	{
		text: $text
		tooltip: ''
	} | to json --raw

}

export def main [col:int] { _main $col }
