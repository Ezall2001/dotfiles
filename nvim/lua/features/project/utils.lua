local c = require('constants')
local M = {}

M.search_project = function(start_path)
	local project_path = vim.fs.find(c.path.project_dir, {
		type = 'directory',
		path = start_path,
		upward = true,
		follow = true,
	})[1]

	return project_path
end

return M
