local u = require("features.plugins.utils")
local r = require("features.plugins.registry")

local register_plugin = function(name)
	local pattern = u.create_plugin_event_name(name)

	r.add(name)
	vim.api.nvim_exec_autocmds("User", { pattern = pattern })
end

return register_plugin
