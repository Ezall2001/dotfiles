local M = {}

M.root_path = '~/personal/dotfiles/dunst'

M.config = function()
	vim.filetype.add({
		pattern = {
			config = 'dosini',
			['.*'] = 'dosini',
		},
	})
end

return M
