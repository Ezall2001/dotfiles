use ../../sfzf [main]

def get_params [buffer:string] {
	{
		query: $buffer
		height: 20%
		list-border: rounded
		scheme: history
	}
}

export def _main [buffer:string] {
	let params = get_params $buffer
	$in | sfzf --params $params
}

# Takes the history parsed output directly for
# performance reasons (no to json | from json)
export def main [buffer='':string]: string -> string {
	_main $buffer
}
