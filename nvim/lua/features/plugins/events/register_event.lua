local u = require("features.plugins.events.utils")
local r = require("features.plugins.events.registry")

local register_plugin = function(name)
	local pattern = u.create_plugin_event_name(name)

	r.add(name)
	vim.api.nvim_exec_autocmds("User", { pattern = pattern })
end

return register_plugin
