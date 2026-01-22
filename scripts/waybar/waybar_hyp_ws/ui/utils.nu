use ./consts.nu [FILL BORDER FILL_H FILL_PLUS BORDER_PLUS]

export def get_icon [vws:record] {
	if not $vws.is_focusable {
		$BORDER
	} else if $vws.has_own and $vws.has_foreign {
		$FILL_PLUS
	} else if not $vws.has_own and $vws.has_foreign {
		$BORDER_PLUS
	} else if $vws.has_own {
		$FILL_H
	} else {
		$BORDER
	}
}

export def get_fg [vws:record] {
	if not $vws.is_focusable {
		"#6272a4"
	} else if $vws.is_active {
		"#FF5C87"
	} else if $vws.is_focused {
		"#00BEDB"
	} else {
		"#fff0f9"
	}
}
