local invoke = require("features.oil.invoke")
local p = require("features.plugins")

local M = {}

local load = function()
	local path = vim.api.nvim_buf_get_name(0)

	if vim.fn.isdirectory(path) == 1 then
		invoke()
	end
end

M.create = function() end

M.load = function()
	p.on_plugin_register("oil", load)
end

M.delete = function() end

M.fallback = function()
	p.on_plugin_register("oil", load)
end

return M
