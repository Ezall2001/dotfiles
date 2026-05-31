local M = {}

M.word_forward = function()
	local line = vim.fn.getcmdline()
	local pos = vim.fn.getcmdpos() - 1

	local new_line = line:sub(1, pos) .. line:sub(pos + 1):gsub('^%S+%s*', '')

	vim.fn.setcmdline(new_line, pos + 1)
end

M.to_end_of_line = function()
	local pos = vim.fn.getcmdpos() - 1
	local line = vim.fn.getcmdline()
	vim.fn.setcmdline(line:sub(1, pos), pos + 1)
end

return M
