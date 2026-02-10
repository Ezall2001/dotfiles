local M = {}

M.commit = function()
	local n = require('neogit')
	n.open({ 'commit' })
end

return M
