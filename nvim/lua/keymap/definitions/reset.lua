local m = require('keymap.lib').map

local reset = function()
	m({ 'n', 'Q', '<nop>' })
	m({ { 'i', 'n', 'v' }, '<C-p>', '<nop>' })
	m({ { 'i', 'n', 'v' }, '<C-n>', '<nop>' })
	m({ { 'n', 'x' }, 'gg', '<nop>' })
	m({ { 'n', 'x' }, 'G', '<nop>' })
end

local M = {}

M.init = function()
	reset()
end

return M
