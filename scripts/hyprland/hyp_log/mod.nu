const FILE = '~/.local/state/hyp_scripts.log' | path expand

def log_level_to_notif_level [level:string] {
	match $level {
		info => 'normal'
		warn => 'normal'
		error => 'critical'
	}
}

export def main [
	msg:string
	module:string
	--notify (-n):string
	--level (-l)=info # info,warn,error
] {
	if $notify != null {
		let level = log_level_to_notif_level $level
		notify-send $notify -t 5000 -u $level
	}

	let timestamp = date now | format date

	let log = $"($timestamp) ($level | str upcase) [($module)]\n($msg)\n\n"
	$log | save -a $FILE
}

export def read [] {
	bat $FILE
}

export def clean [] {
	'' | save -f $FILE
}
