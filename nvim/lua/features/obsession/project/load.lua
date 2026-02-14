local cl = require('features.obsession.constants')

local handle_win = function(win)
	local buf = vim.api.nvim_win_get_buf(win)
	local name = vim.api.nvim_buf_get_name(buf)
	local lines = vim.api.nvim_buf_get_lines(buf, 0, -1, false)

	local is_buf_empty = #lines == 0 or (#lines == 1 and lines[1] == '')
	local has_no_name = name == ''

	if has_no_name and is_buf_empty then
		vim.api.nvim_win_close(win, true)
	end
end

local clean_empty_windows = function()
	local wins = vim.api.nvim_list_wins()
	for _, win in ipairs(wins) do
		handle_win(win)
	end
end

local load = function()
	local project_path = vim.g.project_path
	local filepath = vim.fs.joinpath(project_path, cl.obsession_file)

	if vim.fn.filereadable(filepath) ~= 1 then
		return
	end

	vim.cmd(':source ' .. filepath)

	clean_empty_windows()
end

return load
