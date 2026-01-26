local M = {}

local config = function()
	vim.opt_local.bufhidden = 'wipe'
	vim.cmd('wincmd L')
end

M.init = function()
	vim.api.nvim_create_autocmd('FileType', {
		pattern = { 'help', 'man' },
		callback = config,
	})
end

return M
