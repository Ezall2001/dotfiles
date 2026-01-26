local c = require('constants')
local cl = require('features.obsession.constants')
local p = require('features.plugins')

local M = {}

local create = function()
	vim.cmd(':Obsession ' .. c.path.project_dir)
end

local load = function()
	local project_path = vim.g.project_path
	local filepath = vim.fs.joinpath(project_path, cl.obsession_file)

	if vim.fn.filereadable(filepath) ~= 1 then
		return
	end

	vim.cmd(':source ' .. filepath)
end

local delete = function()
	vim.cmd(':Obsession!')
end

M.create = function()
	p.on_plugin_register('obsession', create)
end

M.load = function()
	p.on_plugin_register('obsession', load)
end

M.delete = function()
	p.on_plugin_register('obsession', delete)
end

M.fallback = function() end

return M
