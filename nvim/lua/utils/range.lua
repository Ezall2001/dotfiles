local M = {}

M.range = function(ls, le, cs, ce)
	return {
		start = { line = ls or 0, character = cs or 0 },
		['end'] = { line = le or 0, character = ce or 0 },
	}
end

return M
