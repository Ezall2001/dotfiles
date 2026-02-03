local get_dir = function(buf)
	local o = require('oil')

	local abs_dir = o.get_current_dir(buf)

	if abs_dir == nil then
		return 'error getting dir'
	end

	local cwd = vim.fn.getcwd()
	local dir = abs_dir

	if vim.startswith(abs_dir, cwd) then
		dir = abs_dir:sub(#cwd + 2)
	end

	if dir == '' then
		return '/'
	else
		return dir
	end
end

return get_dir
