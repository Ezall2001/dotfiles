local r = require('features.lsp').registry

local config_lsp = function(ft)
	r.register_lsps(ft, { 'prettier', 'jsonls', 'colorizer' }, {
		inlay_hint = false,
		document_color = false,
		formatters = { 'null-ls' },
	})
end

return config_lsp
