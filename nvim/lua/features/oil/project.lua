local invoke = require('features.oil.invoke')
local p = require('features.plugins')

local M = {}

local handle_win = function(win)
	local buf = vim.api.nvim_win_get_buf(win)
	local path = vim.api.nvim_buf_get_name(buf)
	if vim.fn.isdirectory(path) ~= 1 then
		return
	end

	vim.api.nvim_set_current_win(win)
	invoke()
end

local load = function()
	local curr_win = vim.api.nvim_get_current_win()

	for _, tab in ipairs(vim.api.nvim_list_tabpages()) do
		for _, win in ipairs(vim.api.nvim_tabpage_list_wins(tab)) do
			handle_win(win)
		end
	end

	vim.api.nvim_set_current_win(curr_win)
end

M.create = function() end

M.load = function()
	p.on_plugin_register('oil', load)
end

M.delete = function() end

M.fallback = function()
	p.on_plugin_register('oil', load)
end

return M
