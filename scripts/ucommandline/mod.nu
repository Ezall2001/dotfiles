
export def main [] {}

export def get [buffer:string, pos:int]: nothing -> record<type:string,start:int,end:int,string:string> {
	~/.config/scripts/ucommandline/dist/ucommandline $buffer $pos | from json
}

export def replace [buffer:string, cursor_str:record<type:string,start:int,end:int,string:string>, new:string]: nothing -> record<buffer:string, pos:int> {
	let type = $cursor_str.type
	let s = if $type == quote {$cursor_str.start - 1} else {$cursor_str.start}
	let e = if $type == quote {$cursor_str.end + 1} else {$cursor_str.end}

	let chars = $buffer | split chars
	let left = $chars | take $s
	let right = $chars | skip ($e + 1)

	let l_char = $left | last
	let r_char = $right | first

	let padding_offset = if $type == none and $l_char != ' ' {1} else {0}
	let pos = $s + ($new | str length) + $padding_offset

	let left_padding = if $type == none and $l_char != ' ' {' '} else {''}
	let right_padding = if $type == none and $r_char != ' ' {' '} else {''}

	let _buffer = $'($left | str join)($left_padding)($new)($right_padding)($right | str join)'

	{buffer: $_buffer pos: $pos}
}
