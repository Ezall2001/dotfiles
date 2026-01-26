local global_config = require('features.lsp.global_config')
local r = require('features.lsp.registry')

local r_base_definition = 'features.lsp.definitions'

local init_lsps = function()
	local reg = r.get_registry()

	for lsp, fts in pairs(reg.lsp_ft_map) do
		local r_path = r_base_definition .. '.' .. lsp
		require(r_path).init(fts)
	end
end

local M = {}

M.init = function()
	global_config.init()
	init_lsps()
end

M.registry = require('features.lsp.registry')

return M
