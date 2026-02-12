local l = require('features.lsp')

local config_lsp = function(ft)
	l.registry.register_lsps(ft, { 'harper_ls' }, {})
end

return config_lsp
