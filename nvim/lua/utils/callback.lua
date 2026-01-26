local M = {}

M.mkcb = function(f, ...)
	local args = { ... }

	return function(...)
		local _args = vim.deepcopy(args, true)
		local all_args = vim.list_extend(_args, { ... })
		return f(unpack(all_args))
	end
end

return M
