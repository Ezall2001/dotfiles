local r = require('features.lsp').registry

local config_lsp = function(ft)
	r.register_lsps(ft, { 'kdlfmt', 'colorizer' }, {
		inlay_hint = false,
		document_color = false,
		formatters = { 'null-ls' },
		on_type_formatting = {},
		semantic_token = {},
	})
end

return config_lsp
