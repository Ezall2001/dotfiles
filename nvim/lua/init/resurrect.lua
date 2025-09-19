local c = require("constants")

local resurrect = function()
	local root = vim.fn.getcwd()
	local project_dir = vim.fs.find(c.project_dir, {
		type = "directory",
		path = root,
		upward = true,
		follow = true,
	})[1]

	if project_dir == nil then
		return
	end

	local filepath = vim.fs.joinpath(project_dir, "Session.vim")

	local file_exists = vim.fn.filereadable(filepath) == 1
	if file_exists then
		vim.cmd(":source " .. filepath)
	end
end

return resurrect
