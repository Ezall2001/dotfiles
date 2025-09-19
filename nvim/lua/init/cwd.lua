local change_cwd = function()
	local cwd = vim.uv.cwd()
	local arg = vim.fn.argv(0)

	if type(arg) ~= "string" or type(cwd) ~= "string" then
		vim.print("invalid arg: " .. arg .. " / cwd: " .. cwd)
		return
	end

	local new_cwd
	if vim.startswith(arg, cwd) then
		new_cwd = arg
	else
		new_cwd = vim.fs.joinpath(cwd, arg)
	end

	if not vim.fn.exists(new_cwd) then
		print("invalid new_cwd: " .. new_cwd)
		return
	end

	local path_type = vim.loop.fs_stat(new_cwd).type
	if path_type == "file" then
		new_cwd = vim.fs.dirname(new_cwd)
	end

	vim.api.nvim_set_current_dir(new_cwd)
end

return change_cwd
