local lsp = function()
	vim.keymap.set("i", "<C-Space>", vim.lsp.completion.get)
end

return lsp
