use ../utils [get_state update_state]
use ../get_setup.nu [main]
use ../../hyp_utils [get_window_primary_vws_ring get_vws_attached_window]
use ./secondary_vws [add_secondary_vws]
use ../../hyp_apps [is_ignored]

## PRIMARY
def get_primary_window [setup:record client:record primary_vws_ring:int] {
	let state = get_state

	let attached_win = get_vws_attached_window $primary_vws_ring primary $state

	let window = if $attached_win == null {
		{
			attached: {type:primary row:$primary_vws_ring}
			primary_vws_ring: $primary_vws_ring
		}
	} else {
		let secondary_vws = add_secondary_vws
		{
			attached: {type:secondary row: $secondary_vws.row}
			primary_vws_ring: $primary_vws_ring
		}
	}

	$window | merge {
		address: $client.address
	}
}

## SECONDARY
def get_secondary_window [setup:record client:record] {
	let vws = add_secondary_vws

	{
		address: $client.address
		attached: {type: secondary row: $vws.row}
		primary_vws_ring: null
	}
}

## IGNORED
def get_ignored_window [client:record] {
	{
		address: $client.address
		attached: null
		primary_vws_ring: null
	}
}

## MAIN
export def main [addr:string] {
	let client = hyprctl clients -j | from json
	| where address == $addr | first

	let setup = get_setup

	let primary_vws_ring = get_window_primary_vws_ring $client.tags $setup

	let window = if (is_ignored $client) {
		get_ignored_window $client
	} else if $primary_vws_ring == null {
		get_secondary_window $setup $client
	} else {
		get_primary_window $setup $client $primary_vws_ring
	}

	let state = get_state
	let new_windows = $state.windows | append $window
	let state = update_state {windows: $new_windows} $state

	$window
}
