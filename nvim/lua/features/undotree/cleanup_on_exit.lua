local cleanup_on_exit = function()
	vim.api.nvim_create_autocmd('QuitPre', {
		callback = function()
			vim.cmd('UndotreeHide')
		end,
	})
end

return cleanup_on_exit
