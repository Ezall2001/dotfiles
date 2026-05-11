local m = require('keymap.lib').map
local t = require('features.tabs')
local u = require('utils.callback')

local create_tab_map = function(idx)
	local key = idx
	if idx == 10 then
		key = 0
	end

	m({
		'n',
		'<leader>' .. key,
		u.mkcb(t.switch_tab, idx),
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
