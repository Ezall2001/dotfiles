use ../../nushell/nui
use ../consts.nu [STYLES]

export def main [params:record] {
	let header = if $params.header? != null {
		#TODO: wrap
		$params.header
	}

	let header_label = if $params.header-label? != null {
		nui ansi style $params.header-label ...$STYLES.header_label
	}

	{header: $header, header-label: $header_label}
}
