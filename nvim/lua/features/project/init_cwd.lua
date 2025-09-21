local get_cwd = function()
	local cwd = vim.uv.cwd()
	local arg = vim.fn.argv(0)

	if type(arg) ~= "string" or type(cwd) ~= "string" then
		vim.notify("invalid arg: " .. arg .. " / cwd: " .. cwd, vim.log.levels.WARN)
		return nil
	end

	local new_cwd = vim.fn.isabsolutepath(arg) and arg or vim.fs.joinpath(cwd, arg)
	new_cwd = vim.loop.fs_stat(new_cwd).type == "file" and vim.fs.dirname(new_cwd) or new_cwd

	return vim.fn.exists(new_cwd) and new_cwd or nil
end

local init_cwd = function()
	local new_cwd = get_cwd()

	if new_cwd == nil then
		vim.notify("could not get new_cwd!", vim.log.levels.WARN)
		return
	end

	vim.api.nvim_set_current_dir(new_cwd)
end

return init_cwd

