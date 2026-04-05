use ../unlock.nu [main]
use ../consts.nu [EXPOSED_PATH BASE_URL]
use ../../ujob
use ../../upath

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

	let items_tag = ujob spawn items {
		let res = http get $'($BASE_URL)/list/object/items'
		$res.data.data
	}
	let folders_tag = ujob spawn folders {
		let res = http get $'($BASE_URL)/list/object/folders'
		$res.data.data
	}

	let tags = ujob await $items_tag --timeout 1min
	| first | get val
	| where type == 1 and login.password != null
	| each {|item|
		sleep 100ms
		ujob spawn $item.id { check $item }
	}

	let folders = ujob await $folders_tag --timeout 1min
	| first | get val

	ujob await --timeout 10min ...$tags
	| get val | where exposed > 0
	| each {format $in $folders}
	| str join "\n\n"
	| upath save -f $EXPOSED_PATH
}
