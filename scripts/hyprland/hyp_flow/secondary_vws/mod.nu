use ../../hyp_menu [main]
use ../../../sfzf [main]
use ./input.nu [get_input]
use ./params.nu [get_params]
use ./const.nu [CMD BINDS]

export use ./controls.nu [focus push_pull make_primary_vws]

export def _menu [] {
	let params = get_params
	let selected = get_input
	| sfzf $CMD --params $params --binds $BINDS

	focus $selected
}

export def main [] {
	hyp_menu [hyp_flow secondary_vws _menu] 'hyp_secondary_vws_manager' {
		size: [600 400]
	}
}
