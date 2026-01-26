local cl = require('features.project.constants')
local u = require('features.project.utils')

local load_components = function()
	for _, cp in ipairs(cl.load_components) do
		cp.project.load()
	end
end

local fallback_components = function()
	for _, cp in ipairs(cl.fallback_components) do
		cp.project.fallback()
	end
end

local attach_project_path = function()
	local cwd = vim.fn.getcwd()
	local project_path = u.search_project(cwd)

	if project_path == nil then
		return false
	end

	vim.g.project_path = project_path
	return true
end

--NOTE: for some reason this has to be either async or delayed a bit ????
local load_cb = function(is_attached)
	if not is_attached then
		vim.notify('no project dir found', vim.log.levels.INFO)
		vim.defer_fn(fallback_components, 10)
		return
	end

	vim.defer_fn(load_components, 10)
end

local load_project = function()
	local is_attached = attach_project_path()

	vim.api.nvim_create_autocmd('VimEnter', {
		once = true,
		callback = function()
			load_cb(is_attached)
		end,
	})
end

return load_project
