local c = function(args)
	vim.api.nvim_create_user_command(args[1], args[2], args[3])
end

return c
