local r = require('utils.require_all_in_dir')

local cb = function(module)
	local path = vim.fn.expand(module.root_path)

	if vim.fn.getcwd() == path then
		module.config()
	end
end

local M = {}

M.init = function()
	require('configs.ft_setters.extension_ft').init()

	local require_projects_path = vim.fs.joinpath('configs', 'ft_setters', 'definitions')
	r(require_projects_path, cb)
end

return M
