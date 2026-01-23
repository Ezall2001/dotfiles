use ../utils [get_state update_state]
use ./secondary_vws.nu [remove_secondary_vws]

export def main [addr:string] {
	let state = get_state

	let win = $state.windows | where address == $addr | first
	if $win == null {return}

	if $win.attached != null and $win.attached.type == secondary {
		remove_secondary_vws $win.attached.row
	}

	let rest = $state.windows | where address != $addr

	update_state {windows: $rest}
	$win
}
