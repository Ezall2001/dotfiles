local c = require("constants")
local p = require("features.plugins")

local ressurect_obsession = function()
	local project_path = vim.g.project_path
	local filepath = vim.fs.joinpath(project_path, "Session.vim")

	if vim.fn.filereadable(filepath) ~= 1 then
		return
	end

	vim.cmd(":source " .. filepath)
end

local attach_project = function()
	local root = vim.fn.getcwd()
	local project_path = vim.fs.find(c.project_dir, {
		type = "directory",
		path = root,
		upward = true,
		follow = true,
	})[1]

	if project_path == nil then
		return false
	end

	vim.g.project_path = project_path
	return true
end

local load_project = function()
	local is_attached = attach_project()

	if not is_attached then
		vim.notify("no project dir found", vim.log.levels.INFO)
		return
	end

	p.on_plugin_register("obsession", ressurect_obsession)
end

return load_project
