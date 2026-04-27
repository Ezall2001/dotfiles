def gen [spec:record] {
	if ($spec.dst | path exists) {
		^doas rm -rf $spec.dst
	}

	^doas cp -r $spec.src $spec.dst
	^doas chown -R root:fcron $spec.dst
}

export def main [] {
	{
		name: fcron
		gens: [
			{
				src: ~/.config/fcron
				dst: /etc/fcron
				gen: {|spec| gen $spec}
			}
		]
	}
}
