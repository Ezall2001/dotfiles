local tabs = require('keymap.definitions.structure.tabs')
local windows = require('keymap.definitions.structure.windows')

local M = {}

M.init = function()
	tabs.init()
	windows.init()
end

return M
