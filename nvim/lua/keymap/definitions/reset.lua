local m = require("keymap.lib").map

local reset = function()
	m({ "n", "Q", "<nop>" })
end

local M = {}

M.init = function()
	reset()
end

return M
