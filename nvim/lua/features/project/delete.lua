local cl = require('features.project.constants')

local delete_components = function()
	for _, cp in ipairs(cl.delete_components) do
		cp.project.delete()
	end
end

local delete_project = function()
	local project_path = vim.g.project_path

	if vim.fn.isdirectory(project_path) == 0 then
		vim.notify('no project is loaded', vim.log.levels.WARN)
		return
	end

	delete_components()

	vim.fn.delete(project_path, 'rf')
	vim.g.project_path = nil
end

return delete_project
