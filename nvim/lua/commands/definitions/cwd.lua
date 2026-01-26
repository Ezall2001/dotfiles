local c = require('commands.lib')
local cwd = require('features.dev.cwd')

local M = {}

M.init = function()
	c({ 'PrintCwd', cwd.print_cwd, {} })
end

return M
