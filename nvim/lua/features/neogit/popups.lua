local M = {}

M.commit = function()
	local n = require('neogit')
	n.open({ 'commit' })
end

M.stash = function()
	local n = require('neogit')
	n.open({ 'stash' })
end

return M
