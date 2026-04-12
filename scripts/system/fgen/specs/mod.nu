use ./btop.nu [main]
use ./scripts.nu [main]

def normalize [spec:record] {
	$spec | merge {
		src: ($spec.src | path expand)
		dst: ($spec.dst | path expand)
	}
}

export def main [] {
	[
		(btop)
		(scripts)
	] | each {normalize $in}
}
