local c = require('features.undotree.constants')

local M = {}

local get_dir_path = function()
	return vim.fs.joinpath(vim.g.project_path, c.undotree_dir)
end

M.create = function()
	vim.fn.mkdir(get_dir_path())
	M.load()
end

M.load = function()
	vim.o.undodir = get_dir_path()
end

M.delete = function()
	vim.o.undodir = c.default_undotree_dir
end

M.fallback = function()
	vim.o.undodir = c.default_undotree_dir
end

return M
