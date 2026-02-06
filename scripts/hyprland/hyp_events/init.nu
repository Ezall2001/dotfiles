use ../hyp_utils [get_socket]
use ./handlers/window.nu [window_opened_handler window_closed_handler move_window_handler active_window_change_handler]
use ./handlers/workspace.nu [workspace_changed_handler move_workspace_handler]
use ./handlers/monitor.nu [monintor_added_handler monintor_removed_handler active_monitor_change_handler]
use ../hyp_log [main]


def handler [event:string] {
	let event = $event | split row '>>'
	let name = $event.0
	let args = $event.1 | split row ','

	match $name {
		monitoradded => {monintor_added_handler $args.0}
		monitorremoved => {monintor_removed_handler $args.0}
		focusedmon => {active_monitor_change_handler $args.0 $args.1}
		workspace => {workspace_changed_handler $args.0}
		moveworkspace => {move_workspace_handler $args.0 $args.1}
		openwindow => {window_opened_handler $args.0}
		closewindow => {window_closed_handler $args.0}
		movewindow => {move_window_handler $args.0 $args.1}
		activewindowv2 => {active_window_change_handler $args.0}
	}

}

export def main [] {
	try {
		socat -U - $"UNIX-CONNECT:(get_socket 2)"
		| lines | each {handler $in} | ignore
	} catch {|e|
		hyp_log $e.rendered hyp_events --notify 'hyp_events error' --level error
	}
}
