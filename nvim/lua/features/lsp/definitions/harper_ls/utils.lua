local M = {}

M.get_ws_dict_path = function()
	local project_path = vim.g.project_path
	if project_path == nil then
		return vim.fs.joinpath(vim.fn.getcwd(), "ws_dict.txt")
	end

	return vim.fs.joinpath(vim.g.project_path, "harper", "ws_dict.txt")
end

M.get_file_dict_dir_path = function()
	local project_path = vim.g.project_path
	if project_path == nil then
		return vim.fs.joinpath(vim.fn.getcwd(), "file_dict")
	end

	return vim.fs.joinpath(vim.g.project_path, "harper", "file_dict")
end

M.get_user_dict_path = function()
	return vim.fn.expand("$XDG_DATA_HOME/harper-ls/dictionary.txt")
end

return M
