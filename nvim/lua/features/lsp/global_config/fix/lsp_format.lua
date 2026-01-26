local r = require('features.lsp.registry')

local get_client = function(clients, name)
	for _, client in ipairs(clients) do
		if client.name == name then
			return client
		end
	end
	return nil
end

local lsp_format = function(buf)
	local clients = vim.lsp.get_clients({ bufnr = buf })

	local ft = vim.bo[buf].filetype
	local formatter_names = r.get_registry().formatters[ft] or {}

	for _, name in ipairs(formatter_names) do
		local client = get_client(clients, name)

		if client ~= nil then
			vim.lsp.buf.format({ bufnr = buf, id = client.id })
		end
	end
end

return lsp_format
