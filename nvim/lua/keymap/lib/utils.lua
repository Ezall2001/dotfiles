local M = {}

M.create_map = function(params)
	local _opts = params[4] or {}
	return { params[1], params[2], params[3], _opts }
end

return M
