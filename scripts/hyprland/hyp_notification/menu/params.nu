use ../../../sfzf [STYLED_FZF_DELIMETER]

export def get_params [state:record] {
	{
		header-label: actions
		header: (get_header $state)
		with-nth: $"{2}($STYLED_FZF_DELIMETER){3}"
		preview: "hyp_notification _preview {1}"
		accept-nth: 1
		nth: null
		input-border: null
		header-border: horizontal
		no-separator: true
	}
}
