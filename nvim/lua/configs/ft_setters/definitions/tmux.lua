local M = {}

M.root_path = '~/personal/dotfiles/tmux'

M.config = function()
	vim.filetype.add({
		pattern = {
			['.*/.*%.conf'] = 'tmux',
		},
	})
end

return M
