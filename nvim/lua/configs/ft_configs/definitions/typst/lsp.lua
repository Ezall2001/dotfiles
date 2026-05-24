local l = require('features.lsp')

local conf = {
	colorizer = false,
}

conf.builtin = {
	tinymist = {
		feats = { 'formatting', 'document_color', 'inlay_hint', 'semantic_tokens', 'on_type_formatting' },
	},
	harper_ls = {},
}

conf.null_ls = {
	lsps = {},
	feats = {},
}

local config_lsp = function(ft)
	l.registry.register_lsps(ft, conf)
end

return config_lsp
