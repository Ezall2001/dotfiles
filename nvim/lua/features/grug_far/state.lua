local c = require('features.grug_far.constants')

local M = {}

M.get_dir = function()
	local t = ''
	if vim.g.project_path == nil then
		t = c.default_grug_dir
	else
		t = vim.fs.joinpath(vim.g.project_path, c.grug_dir)
	end
	return t
end

return M
