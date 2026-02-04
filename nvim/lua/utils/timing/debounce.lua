local u = require('utils.callback')

local debounce = function(f, interval)
	local timer = vim.loop.new_timer()

	if timer == nil then
		vim.notify("couldn't init timer", vim.diagnostic.severity.ERROR)
		return f
	end

	local wrapper = function(...)
		local args = { ... }
		local cb = u.mkcb(f, unpack(args))

		timer:stop()
		timer:start(interval, 0, vim.schedule_wrap(cb))
	end

	return wrapper
end

return debounce
