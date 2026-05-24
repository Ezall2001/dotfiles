local r = require('features.lsp').registry

local conf = {
	colorizer = true,
}

conf.builtin = {
	basedpyright = {
		feats = { 'inlay_hint', 'on_type_formatting', 'semantic_tokens' },
	},

	ruff = {
		feats = { 'formatting', 'on_type_formatting' },
	},
}

conf.null_ls = {
	lsps = {},
	feats = {},
}

local config_lsp = function(ft)
	r.register_lsps(ft, conf)
end

return config_lsp
