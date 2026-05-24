local l = require('features.lsp')

local conf = {
	colorizer = false,
}

conf.builtin = {
	harper_ls = {},
}

conf.null_ls = {
	lsps = { 'commitlint' },
	feats = {},
}

local config_lsp = function(ft)
	l.registry.register_lsps(ft, conf)
end

return config_lsp
