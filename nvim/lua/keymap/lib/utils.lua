local M = {}

M.create_map = function(params)
	local _opts = params[3] or {}
	return { params[0], params[1], params[2], _opts }
end

return M
