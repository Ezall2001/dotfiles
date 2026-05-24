local apply_edit = function(client, ca)
	vim.lsp.util.apply_workspace_edit(ca.edit, client.offset_encoding or 'utf-8')
end

return apply_edit
