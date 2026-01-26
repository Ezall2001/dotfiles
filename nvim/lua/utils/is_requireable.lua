local p = require('utils.path')

local is_requireable = function(r_path)
	local abs_path = p.get_abs_path(r_path)
	local file_abs_path = abs_path .. '.lua'
	local abs_init_path = vim.fs.joinpath(abs_path, 'init.lua')

	if vim.fn.filereadable(file_abs_path) == 1 then
		return true
		end

	if vim.fn.isdirectory(abs_path) == 1
			and vim.fn.filereadable(abs_init_path) == 1 then
		return true
	end

	return false
end

return is_requireable
