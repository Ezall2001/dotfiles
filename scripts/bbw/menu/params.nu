use ../../sfzf [STYLED_FZF_DELIMETER, FZF_DELIMETER]
use header.nu [get_header]

export def get_params [state:record] {
	{
		header-label: actions
		header: (get_header $state)
		accept-nth: 1
		nth: "1,2,3"
		with-nth: $"{2}($STYLED_FZF_DELIMETER){3}($STYLED_FZF_DELIMETER){4}"
		preview: "bbw _preview {1}"
	}
}
