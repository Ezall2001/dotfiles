use ./ui/text_ui.nu [main]
use ./get_vws_list [main]

export use ./refresh.nu [main]

export def _main [col:int] {
	let vws_list = get_vws_list $col

	{
		text: (text_ui $vws_list)
		tooltip: ''
	} | to json --raw

}

export def main [col:int] { _main $col }
