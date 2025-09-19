local source_curr = function()
	vim.cmd("write")
	vim.cmd("source %")
end

return source_curr
