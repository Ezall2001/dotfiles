--#selene: allow(mixed_table)
local o = require('features.oil')

local cwd = function()
	return vim.fn.getcwd()
end

local project = function()
	if vim.g.project_path ~= nil then
		return ''
	end

	return ''
end

local dir_component = function()
	local dir = o.dir()
	if vim.endswith(dir, '/') then
		return dir:sub(0, #dir - 1)
	else
		return dir
	end
end

return {
	sections = {
		lualine_a = { project, cwd },
		lualine_b = { dir_component },
	},
	filetypes = { 'oil' },
}
