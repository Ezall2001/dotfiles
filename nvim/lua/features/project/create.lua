local c = require("constants")

local create_project = function()
	local root = vim.fn.getcwd()
	local project_path = vim.fs.joinpath(root, c.project_dir)

	if vim.fn.isdirectory(project_path) == 1 then
		vim.notify("project is already initialized", vim.log.levels.INFO)
		return
	end

	vim.fn.mkdir(project_path)
	vim.g.project_path = project_path

	-- obsession
	vim.cmd(":Obsession " .. c.project_dir)
end

return create_project
