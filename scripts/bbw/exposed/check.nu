use ../unlock.nu [main]
use ../consts.nu [EXPOSED_PATH BASE_URL]
use ../../nushell/nui
use ../utils.nu [get_state]

def format [item:record folders:table] {
	let folder = if 'folderId' in $item {
		$folders | where id == $item.folderId
		| first | get name
	} else {'no folder'}

	[
		$'folder: ($folder)'
		$'id: ($item.id)'
		$'name: ($item.name)'
		$'username: ($item.login.username)'
	] | str join "\n"
}

def check [item:record] {
	let res = http get -e $'($BASE_URL)/object/exposed/($item.id)'
	let val = $res.data.data | into int
	$item | merge {exposed:$val}
}

export def main [] {
	let is_unlocked = unlock --no-interactive
	if not $is_unlocked { return }

	let items_tag = nui job spawn items {
		let res = http get $'($BASE_URL)/list/object/items'
		$res.data.data
	}
	let folders_tag = nui job spawn folders {
		let res = http get $'($BASE_URL)/list/object/folders'
		$res.data.data
	}

	let tags = nui job await $items_tag --timeout 1min
	| first | get val
	| where type == 1 and login.password != null
	| each {|item|
		sleep 100ms
		nui job spawn $item.id { check $item }
	}

	let folders = nui job await $folders_tag --timeout 1min
	| first | get val

	let state = get_state

	nui job await --timeout 10min ...$tags
	| get val | where ($it.exposed > 0) and ($it.id not-in $state.ignore_exposed)
	| each {format $in $folders}
	| str join "\n\n"
	| nui save -f $EXPOSED_PATH
}
