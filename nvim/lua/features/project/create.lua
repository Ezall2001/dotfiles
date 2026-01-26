local c = require('constants')
local cl = require('features.project.constants')

local create_components = function()
	for _, cp in ipairs(cl.create_components) do
		cp.project.create()
	end
end

local create_project = function()
	local root = vim.fn.getcwd()
	local project_path = vim.fs.joinpath(root, c.path.project_dir)

	if vim.fn.isdirectory(project_path) == 1 then
		vim.notify('project is already initialized', vim.log.levels.INFO)
		return
	end

	vim.fn.mkdir(project_path)
	vim.g.project_path = project_path

	create_components()
end

return create_project
