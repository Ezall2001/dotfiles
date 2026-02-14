local c = require('constants')
local load = require('features.obsession.project.load')
local p = require('features.plugins')

local M = {}

local create = function()
	vim.cmd(':Obsession ' .. c.path.project_dir)
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
