use ../../sfzf [get_state]
use consts.nu [STARTS]
use ../nui/commandline

def handle_spaces [path: string] {
	if ($path | str contains ' ') {$"`($path)`"} else {$path}
}

def format [state:record selected:string]: nothing -> string {
	let start = $STARTS | get $state.start | path expand

	let formatter = if $state.absolute {
		{|p| $p}
	} else {
		{|p| realpath --relative-to $env.PWD $p }
	}

	$selected | split row "\n"
	| each {|p|
		$start | path join $p | do $formatter $in
		| handle_spaces $in
	}
	| str join ' '
}

export def get_output [
	buffer:string
	cursor_str:record<type:string,start:int,end:int,string:string>
	selected:string
]: nothing -> string {
	let state = get_state
	let formatted = format $state $selected
	commandline replace $buffer $cursor_str $formatted | to nuon
}
