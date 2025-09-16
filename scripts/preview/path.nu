def dir [] {
	{|path|
		let type = $path | path type
		if $type != dir {return}

		ls -sa $path | select name size modified | table
	}
}

def img [cols:oneof<int,string> rows:oneof<int,string>] {
	{|path|
		let type = $path | path type
		if $type != file {return}

		let ext = $path | path parse | get extension
		const img_ext = [jpg png]
		if $ext not-in $img_ext {return}

		exec timg -C -W --pixelation kitty $'-g($cols)x($rows)' $path
	}
}

def rest_files [cols:oneof<int,string>] {
	{|path|
		exec bat $'--terminal-width=($cols)' '--color=always' $path
	}
}


export def main [
	path:string
	--cols (-c) = 80:oneof<int,string>
	--rows (-r) = 60:oneof<int,string>
] {
	let parsed = try { $path | path parse } catch { null }
	if $parsed == null { return $'not a path: ($path)' }
	$env.config.use_ansi_coloring = true

	let handlers = [
		(dir)
		(img $cols $rows)
		(rest_files $cols)
	]

	for f in $handlers {
		let res = do $f $path
		if $res == null {continue}
		return $res
	}
}

