local r = require('features.lsp').registry

local conf = {
	colorizer = true,
}

conf.builtin = {
	ts_ls = {
		feats = { 'inlay_hint', 'on_type_formatting', 'semantic_tokens' },
	},
}

conf.null_ls = {
	lsps = { 'prettier' },
	feats = { 'formatting' },
}

local config_lsp = function(ft)
	r.register_lsps(ft, conf)
end

return config_lsp
