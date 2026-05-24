local M = {}

M.handle_res = function(res)
	if res == nil then
		vim.notify('no result', vim.diagnostic.severity.WARN)
		return
	end

	if res.err then
		vim.notify(res.err.message, vim.diagnostic.severity.ERROR)
		return
	end

	return res.result
end

return M
