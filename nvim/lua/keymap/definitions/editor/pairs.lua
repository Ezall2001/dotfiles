local M = {}

M.init = function() end

M.mini_pairs = function()
	return {
		['('] = {
			action = 'open',
			pair = '()',
			neigh_pattern = '[^\\][^%a]',
			register = { bs = true, cr = true },
		},
		[')'] = {
			action = 'close',
			pair = '()',
		},

		['['] = {
			action = 'open',
			pair = '[]',
			neigh_pattern = '[^\\][^%a]',
			register = { bs = true, cr = true },
		},
		[']'] = {
			action = 'close',
			pair = '[]',
		},

		['{'] = {
			action = 'open',
			pair = '{}',
			neigh_pattern = '[^\\][^%a]',
			register = { bs = true, cr = true },
		},
		['}'] = {
			action = 'close',
			pair = '{}',
		},

		['"'] = {
			action = 'closeopen',
			pair = '""',
			neigh_pattern = '[^\\][^%a]',
			register = { cr = false, bs = true },
		},
		["'"] = {
			action = 'closeopen',
			pair = "''",
			neigh_pattern = '[^%a\\][^%a]',
			register = { cr = false, bs = true },
		},
		['`'] = {
			action = 'closeopen',
			pair = '``',
			neigh_pattern = '[^\\][^%a]',
			register = { cr = false, bs = true },
		},
	}
end

return M
