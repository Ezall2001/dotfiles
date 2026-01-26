local M = {}

M.init = function()
	require('features.project.init_cwd')()
	require('features.project.load')()
end

M.create = require('features.project.create')
M.delete = require('features.project.delete')
return M
