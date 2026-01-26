local M = {}

local inlay_hint_cb = function(e)
	vim.lsp.inlay_hint.enable(true, { bufnr = e.buf })
end

local document_color_cb = function(e)
	vim.lsp.document_color.enable(true, e.buf, { style = 'virtual' })
end

M.init = function()
	local r = require('features.lsp.registry').get_registry()

	vim.api.nvim_create_autocmd('FileType', {
		pattern = r.inlay_hint,
		callback = inlay_hint_cb,
	})

	vim.api.nvim_create_autocmd('FileType', {
		pattern = r.document_color,
		callback = document_color_cb,
	})
end

return M
