local i = require('constants').icons.programming

local config = function()
	return {
		severity_sort = true,
		signs = {
			text = {
				[vim.diagnostic.severity.ERROR] = i.error(),
				[vim.diagnostic.severity.WARN] = i.warn(),
				[vim.diagnostic.severity.INFO] = i.info(),
				[vim.diagnostic.severity.HINT] = i.hint(),
			},
		},
		underline = true,
		virtual_lines = false,
		virtual_text = false,
	}
end

--TODO: make this behavior for all ignored file by .gitignore
local remove_ignored_diagnostics_on_exit = function()
	vim.api.nvim_create_autocmd('DiagnosticChanged', {
		pattern = '**/.nvim/*',
		callback = function(args)
			local diags = vim.diagnostic.get(args.buf)

			if #diags == 0 then
				return
			end

			vim.bo[args.buf].bufhidden = 'wipe'
			vim.diagnostic.reset(nil, args.buf)
			vim.diagnostic.enable(false, { bufnr = args.buf })
		end,
	})
end

--TODO: remove this
vim.keymap.set('n', '<leader>\\t', function()
	vim.lsp.buf.workspace_diagnostics()
	local c = vim.lsp.get_clients({ name = 'ts_ls' })[1]

	require('workspace-diagnostics').populate_workspace_diagnostics(c.id, 0)
	vim.notify('workspace diag')
end)

local M = {}

M.init = function()
	vim.diagnostic.config(config())
	remove_ignored_diagnostics_on_exit()
end

M.config = config

return M
