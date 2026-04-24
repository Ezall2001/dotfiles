use ../generators/copy.nu [main]

def gen [spec:record] {
	if ($spec.dst | path exists) {
		^sudo rm $spec.dst
	}

	^sudo cp $spec.src $spec.dst
	^sudo chown root $spec.dst
}

export def main [] {
	{
		name: doas
		gens: [
			{
				src: ~/.config/doas/doas.conf
				dst: /etc/doas.conf
				gen: {|spec| gen $spec}
			}
		]
	}
}
