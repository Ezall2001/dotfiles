local r = require('features.lsp').registry

local config_lsp = function(ft)
	r.register_lsps(ft, { 'ts_ls', 'prettier' }, {
		inlay_hint = true,
		document_color = false,
		formatters = { 'null-ls' },
	})
end

return config_lsp
