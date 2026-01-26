local sticky_mark = function(name)
	local y, x = unpack(vim.api.nvim_buf_get_mark(0, name))

	local _y, _x = unpack(vim.api.nvim_win_get_cursor(0))
	vim.api.nvim_buf_set_mark(0, name, _y, _x, {})

	if x == 0 and y == 0 then
		return
	end

	vim.api.nvim_win_set_cursor(0, { y, x })
end

return sticky_mark
