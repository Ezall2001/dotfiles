local r = require('features.lsp.registry').get_registry()

local client_format = function(client, conf, buf)
	if client.name == 'null-ls' and vim.tbl_contains(conf.null_ls.feats, 'formatting') then
		vim.lsp.buf.format({ bufnr = buf, id = client.id })
		return
	end

	local builtin_conf = conf.builtin[client.name]

	if builtin_conf and vim.tbl_contains(builtin_conf.feats, 'formatting') then
		vim.lsp.buf.format({ bufnr = buf, id = client.id })
	end
end

local lsp_format = function(buf)
	local ft = vim.bo[buf].filetype
	local conf = r[ft]

	if conf == nil then
		return
	end

	local clients = vim.lsp.get_clients({ bufnr = buf })

	for _, client in ipairs(clients) do
		client_format(client, conf, buf)
	end
end

return lsp_format
