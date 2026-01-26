local u = require('utils.callback')

local action_fn = function(fn, win_id, args)
	local winmove = require('winmove')
	local _args = args or {}

	if win_id == 0 then
		win_id = vim.fn.win_getid()
	end

	winmove[fn](win_id, unpack(_args))
end

local M = {}

M.swap = u.mkcb(action_fn, 'swap_window_in_direction')
M.resize = u.mkcb(action_fn, 'resize_window')
M.split_into = u.mkcb(action_fn, 'split_into')

return M
