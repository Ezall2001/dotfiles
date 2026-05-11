local M = {}

M.project = require('features.undotree.project')

M.init = function()
	require('features.undotree.cleanup_on_exit')()
end

return M
