export const FZF_DELIMETER = "  "
export const STYLED_FZF_DELIMETER = $"(ansi '#B78F71')($FZF_DELIMETER)(ansi rst)"

export const TOGGLE_ICON_OFF = '󰒉 '
export const TOGGLE_ICON_ON = ' '

export const STATE_FILE = '/tmp/sfzf_state.json'
export const INTERNAL_STATE_FILE = '/tmp/sfzf_internal_state.json'

export const DEFAULT_PARAMS = {
	color: dark
	algo: v2
	multi: true
	smart-case: true
	extended: true
	ansi: true
	highlight-line: true
	cycle: true
	wrap: true
	wrap-sign: '↪'
	scroll-off: 5
	delimiter: $FZF_DELIMETER
	nth: 1
	with-nth: '{1}'
	accept-nth: 1
	header-border: rounded
	footer-border: rounded
	pointer: ''
	marker: '┃'
	marker-multi-line: '┃┃┃'
	tabstop: 2
	scrollbar: '┃'
	#jump-labels: CHARS
	preview-window: 'right,50%,wrap'
	preview-border: line
	prompt: '🐕‍🦺 '
	info: 'default'
	ghost: ": WooF, wOOf, h hhh hh"
	input-border: rounded
}

export const STYLES = {
	footer: ['#ffffff', 'bo']
	header_label: ['purple_bold']
	header_line_title: ['white_bold']
	header_line_icon: ['blue']
	header_line_label: ['blue_italic']
	header_line_key: ['blue_bold']
	header_line_sep: ['white']
}

export const BINDS = [
	{
		events_keys:[tab]
		action:'toggle-out'
	}
	{
		events_keys:[shift-tab]
		action:'toggle-in'
	}
	{
		events_keys:[ctrl-l]
		action:'clear-multi'
	}
	{
		events_keys:[ctrl-d]
		action:'clear-query'
	}
	{
		events_keys:[enter]
		action:'accept'
	}
	# {
	# 	events_keys:[alt-p]
	# 	action:'toggle-preview'
	# }
	{
		events_keys:[ctrl-j]
		action:'preview-half-page-down'
	}
	{
		events_keys:[ctrl-k]
		action:'preview-half-page-up'
	}
	# {
	# 	events_keys:[start]
	# 	action: 'transform[sfzf _test]'
	# }
]
