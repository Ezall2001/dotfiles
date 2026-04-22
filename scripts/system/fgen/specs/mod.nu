use ./btop.nu [main]
use ./scripts.nu [main]
use ./doas.nu [main]
use ./pacman.nu [main]

def normalize [spec:record] {
	$spec | merge {
		src: ($spec.src | path expand)
		dst: ($spec.dst | path expand)
	}
}

export def main [] {
	[
		(pacman)
		(btop)
		(scripts)
		(doas)
	] | each {normalize $in}
}
