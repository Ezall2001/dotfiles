local M = {}

M.project = require('features.grug_far.project')
M.state = require('features.grug_far.state')

M.init = function()
	require('features.undotree.cleanup_on_exit')()
end

return M
