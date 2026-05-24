local global_config = require('features.lsp.global_config')
local r = require('features.lsp.registry').get_registry()
local require_all = require('utils.require_all_in_dir')

local get_lsp_fts = function(lsp, is_null_ls)
	local fts = {}

	for ft, conf in pairs(r) do
		if conf.builtin[lsp] ~= nil or (is_null_ls and vim.tbl_contains(conf.null_ls.lsps, lsp)) then
			table.insert(fts, ft)
		end
	end

	return fts
end

local require_cb = function(mod)
	local fts = get_lsp_fts(mod.name, mod.null_ls)
	mod.init(fts)
end

local dir = vim.fs.joinpath('features', 'lsp', 'definitions')

local M = {}

M.init = function()
	global_config.init()
	require_all(dir, require_cb)
end

M.registry = require('features.lsp.registry')

return M
