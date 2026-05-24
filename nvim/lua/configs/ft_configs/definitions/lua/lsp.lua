local r = require('features.lsp').registry

local conf = {
	colorizer = false,
}

conf.builtin = {
	lua_ls = {
		feats = { 'on_type_formatting', 'semantic_tokens', 'inlay_hint', 'document_color' },
	},
}

conf.null_ls = {
	lsps = { 'stylua', 'selene' },
	feats = { 'formatting' },
}

local config_lsp = function(ft)
	r.register_lsps(ft, conf)
end

return config_lsp
