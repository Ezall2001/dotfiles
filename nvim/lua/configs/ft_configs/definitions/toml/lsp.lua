local r = require('features.lsp').registry

local config_lsp = function(ft)
	r.register_lsps(ft, { 'taplo', 'colorizer' }, {
		inlay_hint = true,
		document_color = false,
		formatters = { 'taplo' },
	})
end

return config_lsp
