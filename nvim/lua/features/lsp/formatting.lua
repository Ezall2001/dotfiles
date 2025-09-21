local pre_write_cb = function(id)
	return function(args)
		vim.lsp.buf.format({ bufnr = args.buf, id = id })
	end
end

local lsp_attach_cb = function(args)
	local client = vim.lsp.get_client_by_id(args.data.client_id)

	if not client then
		return
	end
	if not client.supports_method("textDocument/formatting") then
		return
	end

	vim.api.nvim_create_autocmd("BufWritePre", {
		buffer = args.buf,
		callback = pre_write_cb(client.id),
	})
end

return function()
	vim.api.nvim_create_autocmd("LspAttach", { callback = lsp_attach_cb })
end
