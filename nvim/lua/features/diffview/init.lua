local cleanup = require('features.diffview.cleanup')

local M = {}

M.init = function()
	cleanup()
end

return M
