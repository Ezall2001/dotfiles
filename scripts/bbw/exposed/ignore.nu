use ../utils.nu [get_state update_state]

export def main [id:string] {
	let state = get_state
	let ignored = $state.ignore_exposed | append $id | uniq
	update_state {ignore_exposed:$ignored} $state
	return
}
