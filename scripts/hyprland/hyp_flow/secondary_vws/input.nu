use ../../hyp_setups [get_state]
use ../../hyp_utils []
use ../../../sfzf [FZF_DELIMETER]

def get_win [win:record] {
	let client = hyprctl clients -j | from json
	| where address == $win.address | first

	if $client == null {return}

	[
		$win.attached.row
		$client.class
		$client.title
		$client.address
	] | str join $FZF_DELIMETER
}

export def get_input [] {
	let state = get_state

	$state.windows
	| where ($it.attached != null) and ($it.attached.type == secondary)
	| each {get_win $in} | where $it != null
	| str join "\n"
}
