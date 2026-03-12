export def userscript_write [cmd:oneof<list<string>,string>] {
	let cmd = if ($cmd | describe) == 'string' {[$cmd]} else {$cmd}
	$cmd | str join ';;' | save -a $env.QUTE_FIFO
}
