local d = require('utils.diagnostics')
local r = require('utils.range')

local kinds = {
	'source.addMissingImports.ts',
	'source.fixAll.ts',
}

--NOTE: assuming no errors
--NOTE: the TS server must be queried kind by kind for some reason :)

local filter = function(ca)
	return vim.tbl_contains(kinds, ca.kind)
end

local test = function()
	local client = vim.lsp.get_clients({ name = 'ts_ls' })[1]
	local params = vim.lsp.util.make_range_params(0, client.offset_encoding)

	local diagnostics = d.get_lsp_diagnostic(vim.diagnostic.get(0))

	-- local cas = vim.tbl_filter(filter, res.result)

	for _, kind in ipairs(kinds) do
		local res = client:request_sync('textDocument/codeAction', {
			textDocument = params.textDocument,
			context = { only = { kind }, diagnostics = {} },
			range = r.range(),
		})

		if res == nil then
			return
		end

		vim.print(res)

		local ca = client:request_sync('codeAction/resolve', res.result[1]).result

		vim.print(vim.inspect(ca))

		if ca == nil then
			return
		end

		if ca.edit ~= nil then
			vim.lsp.util.apply_workspace_edit(ca.edit, client.offset_encoding)
		end

		if ca.command ~= nil then
			vim.lsp.client:exec_cmd(ca.command)
		end

		vim.wait(300)
	end
end

vim.keymap.set('n', '<leader>\\t', test)
