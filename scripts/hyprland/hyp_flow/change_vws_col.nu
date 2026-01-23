use ../hyp_utils [get_active_ws]
use ../hyp_setups [get_setup change_vws_col]

export def main [new_col:int row?:int type?:string] {
	let setup = get_setup

	let setup_mon = $setup.monitors | where col == $new_col | first

	if $setup_mon == null {
		notify-send -t 3000 -u critical 'monitor (col) not configured in setup'
		return
	}

	let mon = hyprctl monitors -j | from json
	| where name == $setup_mon.name | first

	if $mon == null {
		notify-send -t 3000 -u critical 'monitor not available'
		return
	}

	let active_ws = get_active_ws $setup

	let row = $row | default ($active_ws.row)
	let type = $type | default ($active_ws.type)

	change_vws_col $new_col $row $type
}
