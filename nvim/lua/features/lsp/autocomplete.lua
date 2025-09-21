local callback = function(args)
	vim.lsp.completion.enable(true, args.data.client_id, args.buf, {
		autotrigger = true,
		convert = function(item)
			return { abbr = item.label:gsub("%b()", "") }
		end,
	})
end

return function()
	vim.api.nvim_create_autocmd("LspAttach", {
		callback = callback,
	})
end
