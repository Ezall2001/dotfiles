export def mon_to_col [mon:string setup:record]: nothing -> int {
	$setup.monitors | where name == $mon
	| first | get col
}

export def col_to_mon [col:int setup:record]: nothing -> string {
	$setup.monitors | get $col | get name
}

export def get_ws_name [row:int type:string]: nothing -> string {
	$"($type)_($row)"
}

export def get_ws_coords [ws:string setup:record]: [
	nothing -> oneof<record<row:int,col:int,type:string>, nothing>
] {
	let ws = hyprctl workspaces -j | from json
	| where name == $ws | first

	if $ws == null {return}

	let parsed = $ws.name | parse '{type}_{row}' | first
	if $parsed == null {return null}

	let row = $parsed.row | into int
	let col = mon_to_col $ws.monitor $setup

	{type:$parsed.type row:$row col:$col}
}

export def get_active_ws [setup:record]: [
	nothing -> oneof<record<row:int,col:int,type:string>, nothing>
] {
	hyprctl activeworkspace -j | from json
	| get name | get_ws_coords $in $setup
}

export def get_focused_ws [col:int setup:record]: [
	nothing -> oneof<record<row:int,col:int,type:string>, nothing>
] {
	let mon = col_to_mon $col $setup

	hyprctl monitors -j | from json | where name == $mon
	| first | get activeWorkspace.name
	| get_ws_coords $in $setup
}
