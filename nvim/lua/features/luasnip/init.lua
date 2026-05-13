---@diagnostic disable: param-type-mismatch
local r = require('utils.require_all_in_dir')
local p = require('features.plugins').on_plugin_register
local M = {}

local cb = function(module)
	module()
end

local _init = function()
	local require_keymap_dir = vim.fs.joinpath('features', 'luasnip', 'ft')
	r(require_keymap_dir, cb)
end

M.init = function()
	p('luasnip', _init)
end

return M
