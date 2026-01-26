--#selene: allow(mixed_table)

local ws_path = function()
	local o = require('oil')

	local dir = o.get_current_dir()

	if dir == nil then
		return 'error getting dir'
	end

	local cwd = vim.fn.getcwd()

	if vim.startswith(dir, cwd) then
		return dir:sub(#cwd + 2)
	end

	return dir
end

local cwd = function()
	return vim.fn.getcwd()
end

local project = function()
	if vim.g.project_path ~= nil then
		return ''
	end

	return ''
end

return {
	sections = {
		lualine_a = { project, cwd },
		lualine_b = { ws_path },
	},
	filetypes = { 'oil' },
}
