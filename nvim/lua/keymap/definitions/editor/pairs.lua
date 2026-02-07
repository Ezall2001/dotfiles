local M = {}

M.init = function() end

M.mini_pairs = function()
	return {
		['('] = {
			action = 'open',
			pair = '()',
			neigh_pattern = '[^\\][%s]',
			register = { bs = true, cr = true },
		},
		[')'] = {
			action = 'close',
			pair = '()',
		},

		['['] = {
			action = 'open',
			pair = '[]',
			neigh_pattern = '[^\\][%s]',
			register = { bs = true, cr = true },
		},
		[']'] = {
			action = 'close',
			pair = '[]',
		},

		['{'] = {
			action = 'open',
			pair = '{}',
			neigh_pattern = '[^\\][%s]',
			register = { bs = true, cr = false },
		},
		['}'] = {
			action = 'close',
			pair = '{}',
		},

		['"'] = {
			action = 'closeopen',
			pair = '""',
			neigh_pattern = '[^\\][%s]',
			register = { cr = false, bs = true },
		},
		["'"] = {
			action = 'closeopen',
			pair = "''",
			neigh_pattern = '[^%a\\][%s]',
			register = { cr = false, bs = true },
		},
		['`'] = {
			action = 'closeopen',
			pair = '``',
			neigh_pattern = '[^\\][%s]',
			register = { cr = false, bs = true },
		},
	}
end

return M
