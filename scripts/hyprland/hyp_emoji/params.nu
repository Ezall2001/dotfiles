use ../../sfzf [STYLED_FZF_DELIMETER]
use ./header.nu [get_header]

export def get_params [] {
	{
		header-label: actions
		header: (get_header)
		with-nth: $"{1}($STYLED_FZF_DELIMETER){2}($STYLED_FZF_DELIMETER){3}"
		accept-nth: 2
		nth: null
		input-border: null
		header-border: horizontal
	}
}
