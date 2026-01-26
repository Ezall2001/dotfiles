local M = {}

M.root_path = '~/personal/dotfiles/ghostty'

M.config = function()
	vim.filetype.add({
		pattern = {
			config = 'dosini',
			['.*/themes/.*'] = 'dosini',
		},
	})
end

return M
