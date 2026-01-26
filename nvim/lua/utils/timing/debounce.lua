local debounce = function(f, interval, init)
	local timer = vim.loop.new_timer()

	if timer == nil then
		vim.notify("couldn't init timer", vim.diagnostic.severity.ERROR)
		return f
	end

	if init == nil or init then
		timer:start(interval, 0, vim.schedule_wrap(f))
	end

	local wrapper = function()
		timer:stop()
		timer:start(interval, 0, vim.schedule_wrap(f))
	end

	return wrapper
end

return debounce
