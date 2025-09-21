local action_fn = function(fn, action, win_id, args)
	local callback = function()
		local winmove = require("winmove")
		local _win_id = win_id or vim.api.nvim_get_current_win()
		local _args = args or {}

		winmove.start_mode(winmove.Mode[action])
		winmove[fn](_win_id, unpack(_args))
		winmove.stop_mode()
	end

	return callback
end

local winmove_mode_to_action = function(fn, action)
	return function(win_id, args)
		return action_fn(fn, action, win_id, args)
	end
end

return {
	swap = winmove_mode_to_action("swap_window_in_direction", "Swap"),
	resize = winmove_mode_to_action("resize_window", "Resize"),
}
