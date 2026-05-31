local get_selection = function()
	local region = vim.fn.getregion(vim.fn.getpos('v'), vim.fn.getpos('.'), { type = vim.fn.mode() })
	local selection = table.concat(region, '\n')
	return vim.fn.escape(selection, '/\\.^$*~[')
end

local M = {}

M.search_selection = function()
	local str = get_selection()
	local cmd = ('/%s'):format(str)
	vim.fn.feedkeys(cmd, 'n')
end

M.search_selection_and_replace = function()
	local str = get_selection()
	local cmd = ':<C-u>%s/' .. str .. '//g<Left><Left>'
	cmd = vim.api.nvim_replace_termcodes(cmd, true, false, true)
	vim.fn.feedkeys(cmd, 'n')
end

return M
