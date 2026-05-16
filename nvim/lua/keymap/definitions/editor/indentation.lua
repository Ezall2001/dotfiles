local m = require('keymap.lib').map

local indentation = function()
	m({
		{ 'n', 'v' },
		',',
		'=',
		{ desc = 'vim default = (indent)' },
	})
	m({
		'n',
		',ap',
		'mz=ap`z',
		{ desc = 'auto indent paragraph' },
	})

	m({
		'n',
		',l',
		'mzJ`z',
		{ desc = 'join with below line' },
	})
end

local M = {}

M.init = function()
	indentation()
end

M.mini_indentation = function()
	return {
		object_scope = ',i',
		object_scope_with_border = ',a',
		goto_top = ',k',
		goto_bottom = ',j',
	}
end

M.mini_splitjoin = function()
	return {
		toggle = ',c',
		split = '',
		join = '',
	}
end

return M
