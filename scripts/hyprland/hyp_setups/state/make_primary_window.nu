use ../../hyp_utils [get_window_primary_vws_ring get_vws_attached_window]
use ../utils [update_state]

def tmp_upadate_state [updated_win:record state:record] {
	let windows = $state.windows | each {|win|
		if $win.address == $updated_win.address {$updated_win} else {$win}
	}

	$state | update windows $windows
}

export def main [addr:string] {
	let state = get_state

	let prv_sec_window = $state.windows | where address == $addr and primary_vws_ring != null
	| first
	if $prv_sec_window == null {return}
	let prv_prim_win = get_vws_attached_window $prv_sec_window.primary_vws_ring primary $state

	let new_prim_win = $prv_sec_window | merge {
		attached: {type:primary row:$prv_sec_window.primary_vws_ring}
	}
	let state = tmp_upadate_state $new_prim_win $state

	if $prv_prim_win == null {
		update_state $state
		return {new_win:$new_prim_win prv_win:null}
	}

	let new_sec_win = $prv_prim_win | merge {
		attached: $prv_sec_window.attached
	}
	let state = tmp_upadate_state $new_sec_win $state
	update_state $state

	return {new_win:$new_prim_win prv_win:$new_sec_win}
}
