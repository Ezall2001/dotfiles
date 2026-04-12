const BINS_DIR = '/usr/bin/scripts/bin'

def gen [spec:record] {
	doas rm -rf $spec.dst
	doas cp -r $spec.src $spec.dst

	if not ($BINS_DIR | path exists) {
		doas mkdir $BINS_DIR
	}

	fd -tx . $spec.dst | lines | each {|path|
		let name = $path | path basename
		let link = $BINS_DIR | path join ($name)
		if ($link | path exists) {doas rm -rf $link}
		doas ln -s $path $link
	}
}

export def main [] {
	{
		name: scripts
		src: ~/.config/scripts
		dst: /usr/bin/scripts
		gen: {|spec| gen $spec}
	}
}
