local cb = function()
	local d = require('diffview')
	local tabs = vim.api.nvim_list_tabpages()

	for _, _ in ipairs(tabs) do
		d.close()
	end
end

local cleanup = function()
	vim.api.nvim_create_autocmd('VimLeavePre', { callback = cb })
end

return cleanup
