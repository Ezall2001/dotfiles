use ../uansi
use consts.nu [STYLES]

export def make_footer_params [params:record] {
	let footer = if $params.footer? != null {
		uansi style $params.footer $STYLES.footer
	}

	{footer:$footer}
}
