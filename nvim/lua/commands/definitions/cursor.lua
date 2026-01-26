local cursor = require('features.window').cursor
local c = require('commands.lib')

local M = {}

M.init = function()
	c({ 'CenterCursor', cursor.center_cursor, {} })
end

return M
