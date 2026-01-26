local r = require("features.plugins.events.registry")
local lu = require("features.plugins.events.utils")
local u = require("utils.callback")

local register_cb = function(names, cb)
	if r.is_registred(names) then
		return cb()
	end
end

local on_plugin_register = function(names, cb)
	local _names = type(names) == "table" and names or { names }

	if r.is_registred(_names) then
		return cb()
	end

	for _, name in ipairs(_names) do
		local pattern = lu.create_plugin_event_name(name)

		vim.api.nvim_create_autocmd("User", {
			once = true,
			group = vim.api.nvim_create_augroup(pattern, { clear = false }),
			pattern = pattern,
			callback = u.mkcb(register_cb, _names, cb),
		})
	end
end

return on_plugin_register
