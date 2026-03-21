export def main [id:int] {
	let notif = dunstctl history | from json
	| get data | flatten | where id.data == $id | first

	if $notif == null {
		return 'notification not found'
	}

	let ts = $notif.timestamp.data | into datetime
	let time_ago = (date now) - $ts

	let progress = if $notif.progress.data == -1 {''} else {
		$' Progress: ($notif.progress.data)%'
	}

	let lines = [
		$"($time_ago) ago"
		$"Urgency: ($notif.urgency.data)($progress)"
		$"($notif.appname.data): ($notif.summary.data)"
		$"($notif.body.data)"
	]

	$lines | str join "\n"
}
