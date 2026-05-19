local M = {}

M.project = require('features.grug_far.project')
M.state = require('features.grug_far.state')
M.invoke = require('features.grug_far.invoke')

M.init = function()
	require('features.undotree.cleanup_on_exit')()
end

return M
