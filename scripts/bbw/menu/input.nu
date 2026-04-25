use ../consts.nu [BASE_URL]
use ../../nushell/nui
use ../../sfzf [FZF_DELIMETER get_state]
use ../utils.nu [typename]

def stringify_item [item:record folders:table] {
	let folder = if 'folderId' in $item {
		$folders | where id == $item.folderId | first | get name
	} else { 'no-folder' }

	let type = typename $item.type
	let item_str = $item | to json --raw

	[$item_str $folder $type $item.name]
	| str join $FZF_DELIMETER
}


export def get_input [state?:record] {
	let items_tag = nui job spawn --tag-name items {
		let res = http get $'($BASE_URL)/list/object/items'
		$res.data.data
	}
	let folders_tag = nui job spawn --tag-name folders {
		let res = http get $'($BASE_URL)/list/object/folders'
		$res.data.data
	}

	let res = nui job await $items_tag $folders_tag
	let items = $res | where tag == $items_tag | first | get val
	let folders = $res | where tag == $folders_tag | first | get val

	$items | each {stringify_item $in $folders}
	| str join "\n"
}
