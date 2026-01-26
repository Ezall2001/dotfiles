local c = require('constants')

local M = {}

local get_file_name = function()
	local hash = vim.fn.sha256(vim.fn.getcwd())
	return 'shada_' .. hash .. '.shada'
end

M.create = function()
	local shadafile = vim.fs.joinpath(vim.g.project_path, get_file_name())
	vim.o.shadafile = shadafile
	vim.cmd('wshada! ' .. shadafile)
	vim.cmd('rshada! ' .. shadafile)
end

M.load = function()
	local shadafile = vim.fs.joinpath(vim.g.project_path, get_file_name())
	vim.o.shadafile = shadafile

	vim.cmd('rshada! ' .. shadafile)
end

M.delete = function()
	local shadafile = c.path.shared_shada
	vim.o.shadafile = shadafile
	vim.cmd('rshada! ' .. shadafile)
end

M.fallback = function() end

return M
