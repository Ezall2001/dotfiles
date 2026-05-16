local M = {}

M.mini_surround = function()
	return {
		add = 'sa',
		delete = 'sd',
		replace = 'sr',
		suffix_last = 'l',
		suffix_next = 'n',
		find = '',
		find_left = '',
		highlight = '',
	}
end

M.init = function() end

return M
