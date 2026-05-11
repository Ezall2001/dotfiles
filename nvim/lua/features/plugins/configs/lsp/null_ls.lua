local n = require('null-ls')

local conf = {
	debug = false,
	log_level = 'warn',
	border = 'rounded',
	cmd = { 'nvim' },
	debounce = 250,
	default_timeout = 5000,
	diagnostic_config = require('features.lsp.global_config').diagnostics_config(),
	diagnostics_format = '#{m}',
	fallback_severity = vim.diagnostic.severity.ERROR,
	notify_format = '[null-ls] %s',
	on_attach = nil,
	on_init = nil,
	on_exit = nil,
	root_dir = require('null-ls.utils').root_pattern('.null-ls-root', 'Makefile', '.git', '.nvim'),
	root_dir_async = nil,
	should_attach = nil,
	temp_dir = nil,
	update_in_insert = false,
}

n.setup(conf)
