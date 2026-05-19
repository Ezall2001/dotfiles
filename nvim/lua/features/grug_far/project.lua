local c = require('features.grug_far.constants')
local p = require('features.plugins').on_plugin_register
local u = require('utils.callback')

local M = {}

local set_dir = function(dir)
	local g = require('grug-far.opts')

	local curr_conf = g.getGlobalOptions()
	local ignore_keys = { 'rgPath', 'extraRgArgs', 'ignoreVisualSelection' }
	for _, key in ipairs(ignore_keys) do
		curr_conf[key] = nil
	end

	local patch_conf = { history = { historyDir = dir } }

	local new_conf = vim.tbl_deep_extend('force', curr_conf, patch_conf)
	---@diagnostic disable-next-line: param-type-mismatch
	g.setGlobalOptionsOverride(new_conf)
end

local get_dir_path = function()
	return vim.fs.joinpath(vim.g.project_path, c.grug_dir)
end

M.create = function()
	vim.fn.mkdir(get_dir_path())
	M.load()
end

M.load = function()
	p('grug_far', u.mkcb(set_dir, get_dir_path()))
end

M.delete = function()
	p('grug_far', u.mkcb(set_dir, c.default_grug_dir))
end

M.fallback = function()
	p('grug_far', u.mkcb(set_dir, c.default_grug_dir))
end

return M
