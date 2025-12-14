# history
$env.config.history.file_format = 'sqlite'
$env.config.history.sync_on_enter = true
$env.config.history.isolation = false

# misc
$env.config.show_banner = false
$env.config.rm.always_trash = true

# command editor
$env.config.edit_mode = "vi"
$env.config.cursor_shape = {
	vi_insert: "line",
	vi_normal: "block"
}
$env.config.buffer_editor = "nvim"
$env.PROMPT_INDICATOR_VI_INSERT = ""
$env.PROMPT_INDICATOR_VI_NORMAL = ""

# comletion
let completer = {|spans|
	carapace $spans.0 nushell ...$spans | from json
}

$env.config.completions = {
	algorithm: "fuzzy"
	sort: "smart"
	case_sensitive: false
	quick: true
	partial: true
	use_ls_colors: true
	external: {
		enable: true
		completer: $completer
	}
}

# terminal integration
$env.config.use_kitty_protocol = true
$env.config.shell_integration = {
	osc133: true osc2: true osc7: true osc8: true osc9_9: true osc633: true
	reset_application_mode: true
}
$env.config.bracketed_paste = true
$env.config.use_ansi_coloring = "auto"

# error display
$env.config.error_style = "fancy"
$env.config.display_errors.exit_code = false
$env.config.display_errors.termination_signal = true

# table display
$env.config.footer_mode = "auto"
$env.config.table = {
	mode: "rounded"
	index_mode: "auto"
	show_empty: true
	padding: { right: 1 left: 1 }
	trim: { methodology: "wrapping" wrapping_try_keep_words: true }
	header_on_separator: false
	abbreviated_row_count: null
	footer_inheritance: true
	missing_value_symbol: '󰟢 '
}

# datetime display
$env.config.datetime_format = {
	normal: "%d-%m-%y %H%M.%S"
	table: null
}

# filesize display
$env.config.filesize = {
	unit: 'metric'
	show_unit: true
	precision: 1
}

# Misc Display
$env.config.render_right_prompt_on_last_line = false
$env.config.float_precision = 3
$env.config.ls.use_ls_colors = true
