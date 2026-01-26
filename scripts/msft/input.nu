use ../sfzf [FZF_DELIMETER get_state]
use const.nu [DELIMITER]

def get_table [] {
	gtrash find --show-size --show-trashpath |
	from tsv --noheaders |
	rename timestamp size path trashpath |
	update size {into filesize} |
	update timestamp {into datetime}
}

def get_group_table [] {
	get_table |
	group-by timestamp |
	items {|timestamp,table|
		{
			timestamp: ($table.timestamp | first)
			size: ($table.size | math sum)
			path: ($table.path | str join $DELIMITER)
			trash_path: ($table.trashpath | str join $DELIMITER)
		}
	}
}

def _sort [by:string order:int]: table -> table {
	let t = $in
	let reverse = $order == -1

	if $by == score {$t} else {
		$t | sort-by {get $by} --reverse=$reverse
	}
}

def stringify []: table -> string {
	update timestamp {format date '%F %T'} |
	each {|row| $row | values | str join $FZF_DELIMETER} |
	str join "\n"
}


export def get_input [state?:record] {
	let state = $state | default (get_state)

	if $state.group {get_group_table} else {get_table} |
	_sort $state.sort $state.sort_direction |
	stringify
}
