local l = require('features.lsp')

local config_lsp = function(ft)
	l.registry.register_lsps(ft, { 'tinymist', 'harper_ls' }, {
		inlay_hint = true,
		document_color = true,
		formatters = { 'tinymist' },
	})
end

return config_lsp
