local cleanup = require('features.diffview.cleanup')

local M = {}

M.init = function()
	cleanup()
end

M.invoke = require('features.diffview.invoke')

return M
