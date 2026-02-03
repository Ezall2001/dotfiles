local m = require('keymap.lib').map
local u = require('utils.callback')

local switch_tab = function(idx)
	local tab = vim.api.nvim_list_tabpages()[idx]
	if tab then
		vim.api.nvim_set_current_tabpage(tab)
	end
end

local create_tab_map = function(idx)
	local key = idx
	if idx == 10 then
		key = 0
	end

	m({
		'n',
		'<leader>' .. key,
		u.mkcb(switch_tab, idx),
		{ desc = 'switch to tab ' .. idx },
	})
end

local tabs = function()
	for i = 1, 10 do
		create_tab_map(i)
	end
end

local M = {}

M.init = function()
	tabs()
end

return M
