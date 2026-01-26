local M = {}

M.get_root = function()
	return vim.fn.getcwd()
end

M.get_main_file = function()
	local main_file_p = vim.fs.joinpath(M.get_root(), "main.typ")

	if vim.fn.filereadable(main_file_p) then
		return main_file_p
	end

	return nil
end

return M
