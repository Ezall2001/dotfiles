local c = require('commands.lib')
local r = require('utils.range')

local M = {}

local print_code_actions = function(opts)
	local doc = vim.lsp.util.make_text_document_params(0)
	local name = opts.args

	local client = vim.lsp.get_clients({ name = name })[1]
	local res = client:request_sync('textDocument/codeAction', {
		textDocument = doc,
		context = { diagnostics = {} },
		range = r.range(),
	})

	if res == nil or res.result == nil then
		vim.notify('no result', vim.diagnostic.severity.WARN)
		return
	end

	if res.err then
		vim.notify(res.err.message, vim.diagnostic.severity.ERROR)
		return
	end

	local ca_map = { no_key = {} }

	for _, ca in ipairs(res.result) do
		local key = 'no_key'

		if ca.kind ~= nil then
			key = 'key.' .. ca.kind
		elseif ca.command then
			key = 'cmd.' .. ca.command
		end

		if ca_map[key] == nil then
			ca_map[key] = { ca.title }
		else
			table.insert(ca_map[key], ca.title)
		end
	end

	vim.print(vim.inspect(ca_map))
end

local complete_lsps = function()
	local names = {}
	for _, lsp in ipairs(vim.lsp.get_clients()) do
		table.insert(names, lsp.name)
	end

	return names
end

M.init = function()
	c({
		'PrintCodeActions',
		print_code_actions,
		{ nargs = 1, complete = complete_lsps },
	})
end

return M
