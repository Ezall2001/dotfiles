local M = {}

M.on_init = function(client)
	vim.lsp.on_type_formatting.enable(false, { client_id = client.id })
	vim.lsp.semantic_tokens.enable(true, { client_id = client.id })
end

return M
