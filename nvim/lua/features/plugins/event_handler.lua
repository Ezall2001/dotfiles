local r = require("features.plugins.registry")
local u = require("features.plugins.utils")

local create_cb = function(name, cb)
	return function()
		local plugin = pcall(require, name) or nil
		cb(plugin)
	end
end

local on_plugin_register = function(name, cb)
	local _cb = create_cb(name, cb)

	if r.is_registred(name) then
		_cb()
		return
	end

	local pattern = u.create_plugin_event_name(name)

	vim.api.nvim_create_autocmd("User", {
		group = vim.api.nvim_create_augroup(pattern, { clear = false }),
		pattern = pattern,
		callback = _cb,
	})
end

return on_plugin_register
