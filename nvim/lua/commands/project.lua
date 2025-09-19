local c = require("constants")

local init_project = function()
	local root = vim.fn.getcwd()
	local project_path = vim.fs.joinpath(root, c.project_dir)

	if vim.fn.isdirectory(project_path) == 1 then
		vim.print("project is already initialized")
		return
	end

	vim.fn.mkdir(project_path)
	vim.cmd(":Obsession " .. c.project_dir)
end

local remove_project = function()
	local root = vim.fn.getcwd()
	local project_path = vim.fs.joinpath(root, c.project_dir)

	if vim.fn.isdirectory(project_path) == 0 then
		vim.print("project is not initialized")
		return
	end

	vim.cmd(":Obsession!")
	vim.fn.delete(project_path, "rf")
end

return {
	init_project = init_project,
	remove_project = remove_project,
}
