local p = require("features.plugins")
local o = require("features.oil")

local invoke_oil_on_vim_enter = function(_)
	local path = vim.api.nvim_buf_get_name(0)

	if vim.fn.isdirectory(path) ~= 1 then
		return
	end

	o.invoke()
end

return function()
	p.on_plugin_register("oil", invoke_oil_on_vim_enter)
end
