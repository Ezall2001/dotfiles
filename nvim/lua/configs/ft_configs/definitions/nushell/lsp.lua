local r = require('features.lsp').registry

local conf = {
	colorizer = true,
}

conf.builtin = {
	nushell = {
		feats = { 'inlay_hint', 'semantic_tokens' },
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
