use ./btop.nu [main]
use ./scripts.nu [main]
use ./doas.nu [main]
use ./pacman.nu [main]
use ./ly.nu [main]
use ./fcron.nu [main]

def normalize [spec:record] {
	let normalized_gens = $spec.gens | each {|gen|
		$gen | merge {
				src: ($gen.src | path expand)
				dst: ($gen.dst | path expand)
		}
	}

	$spec | merge {gens: $normalized_gens}
}

export def main [] {
	[
		(ly)
		(fcron)
		(pacman)
		(btop)
		(scripts)
		(doas)
	] | each {normalize $in}
}
