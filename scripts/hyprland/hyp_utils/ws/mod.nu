export def mon_to_col [mon:string setup:record]: nothing -> int {
	$setup.monitors | where name == $mon
	| first | get col
}

export def col_to_mon [col:int setup:record]: nothing -> string {
	$setup.monitors | get $col | get name
}

export def get_ws_name [row:int col:int]: nothing -> string {
	$"($row):($col)"
}

export def get_ws_coords [ws:string]: [
	nothing -> record<row:int,col:int>
] {
	let _ = $ws | split row ":" | into int
	{row:$_.0 col:$_.1}
}
