export def main [client:record] {
	let curr_ws = hyprctl activeworkspace -j | from json | get name
	let same_ws = $client.workspace.name == $curr_ws

	if $same_ws {
		hyprctl dispatch focuswindow address:($client.address)
	} else {
		hyprctl dispatch movetoworkspace name:($curr_ws), address:($client.address)
	}
}
