local u = require('features.project.utils')

local set_cwd = function(cwd)
	if cwd == nil then
		return
	end
	vim.api.nvim_set_current_dir(cwd)
end

local init_cwd = function()
	local env_cwd = vim.uv.cwd()
	local arg = vim.fn.argv(0)

	if type(arg) ~= 'string' or type(env_cwd) ~= 'string' then
		vim.notify('invalid arg: ' .. arg .. ' / cwd: ' .. env_cwd, vim.log.levels.WARN)
		return nil
	end

	-- try to determine the path passed from the cli
	local start_cwd = vim.fn.isabsolutepath(arg) == 1 and arg or vim.fs.joinpath(env_cwd, arg)
	start_cwd = vim.loop.fs_stat(start_cwd).type == 'file' and vim.fs.dirname(start_cwd) or start_cwd

	-- if it fails use cwd of the cli from which nvim was invoked
	start_cwd = vim.fn.exists(start_cwd) == 1 and start_cwd or env_cwd

	-- use the start_cwd to search for the closest project_dir
	-- if found change the cwd to its parent
	-- else accept the start_cwd
	local project_path = u.search_project(start_cwd)
	if project_path == nil then
		set_cwd(start_cwd)
		return
	end

	local project_cwd = vim.fs.dirname(project_path)
	set_cwd(project_cwd)
end

return init_cwd
