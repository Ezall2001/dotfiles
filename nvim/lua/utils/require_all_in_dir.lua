local consts = require("constants")

local require_all_in_dir = function(require_dir_path, callback)
	local absolute_dir = vim.fs.joinpath(consts.nvim_root_dir, "lua", require_dir_path)
	local file_names = vim.fn.readdir(absolute_dir)

	for _, name in ipairs(file_names) do
		local root_name = vim.fn.fnamemodify(name, ":r")
		local module_path = vim.fs.joinpath(require_dir_path, root_name)
		local module = require(module_path)

		callback(module)
	end
end

return require_all_in_dir
