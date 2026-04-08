use ../nushell/nui
use consts.nu [STYLES]

export def make_footer_params [params:record] {
	let footer = if $params.footer? != null {
		nui ansi style $params.footer $STYLES.footer
	}

	{footer:$footer}
}
