export def get_socket [num:int] {
	let name = if $num == 1 {'.socket.sock'} else {".socket2.sock"}
	$'($env.XDG_RUNTIME_DIR)/hypr/($env.HYPRLAND_INSTANCE_SIGNATURE)/($name)'
}
