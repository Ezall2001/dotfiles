use ../../../sfzf [FZF_DELIMETER]

def stringify_row [r:record]: nothing -> string {
	[$r.id $r.appname $r.summary]
	| each {$in.data}
	| str join $FZF_DELIMETER
}

export def get_input [] {
	dunstctl history | from json
	| get data | flatten | select id appname summary
	| each {|notif| stringify_row $notif }
	| str join "\n"
}
