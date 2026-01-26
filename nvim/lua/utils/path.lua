local c = require('constants')

local M = {}

M.get_abs_path = function(r_path)
	return vim.fs.joinpath(c.path.nvim_root_dir, 'lua', r_path)
end

M.get_project_path = function(path)
	local rel = vim.fn.fnamemodify(path, ':.')
	return rel
end

M.shorten_path = function(path, pre_len, suf_len)
	suf_len = suf_len or 0

	local sep = '/'
	local parts = vim.split(path, sep, { trimempty = true })

	for i = 1, #parts - 1 do
		local s = parts[i]
		local _suf_len = pre_len >= #s and 0 or suf_len
		local suf_start = (#s - _suf_len + 1)
		parts[i] = s:sub(1, pre_len) .. s:sub(suf_start, #s + 1)
	end

	return (path:sub(1, 1) == sep and sep or '') .. table.concat(parts, sep)
end

return M
