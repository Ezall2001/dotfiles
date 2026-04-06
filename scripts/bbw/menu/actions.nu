use ../../sfzf [get_state update_state reload_input join_actions]
use header.nu [get_header]
use ../consts.nu [BASE_URL]
use fields.nu [FIELDS_MAP]
use ../sync.nu

alias _sync = sync

export def yank [field:int item:string] {
	$item | save -f /tmp/bbw

	let item = $item | from json
	let getter = FIELDS_MAP | get ($item.type - 1)
	| get $field | get getter


	try {
		let val = do $getter $item
		$val | clipse -c
		notify-send -u LOW -t 1000 'field copied'
	} catch {|e|
		notify-send -u CRITICAL 'error while yanking field'
	}

	''
}

export def sync [] {
	let id = notify-send -u LOW 'start sync' --print-id
	_sync
	notify-send 'sync complete' --replace-id $id -t 1000

	join_actions [
		(reload_input)
	]
}
