local m = require('keymap.lib').map

local M = {}

local undotree = function()
	m({
		'n',
		'?',
		'<plug>UndotreeHelp',
		{ desc = 'Toggle help', buffer = true },
	})
	m({
		'n',
		'q',
		'<plug>UndotreeClose',
		{ desc = 'Close', buffer = true },
	})
	m({
		'n',
		'<leader>ux',
		'<plug>UndotreeClearHistory',
		{ desc = 'Clear history', buffer = true },
	})
	m({
		'n',
		'<leader>up',
		'<plug>UndotreeDiffToggle',
		{ desc = 'Clear history', buffer = true },
	})
	m({
		'n',
		'u',
		'<plug>UndotreeUndo',
		{ desc = 'Undo', buffer = true },
	})
	m({
		'n',
		'U',
		'<plug>UndotreeRedo',
		{ desc = 'Redo', buffer = true },
	})
	m({
		'n',
		'<Cr>',
		'<plug>UndotreeEnter',
		{ desc = 'Enter', buffer = true },
	})
	m({
		'n',
		'<leader>ud',
		'<plug>UndotreeDiffMark',
		{ desc = 'Set diff mark', buffer = true },
	})
	m({
		'n',
		'<leader>uD',
		'<plug>UndotreeClearDiffMark',
		{ desc = 'Clear diff mark', buffer = true },
	})
	m({
		'n',
		']u',
		'<plug>UndotreeNextState',
		{ desc = 'Previous undotree state', silent = true, buffer = true },
	})
	m({
		'n',
		'[u',
		'<plug>UndotreePreviousState',
		{ desc = 'Next undotree state', silent = true, buffer = true },
	})
end

local undo = function()
	m({
		'n',
		'<leader>u',
		'<Cmd>UndotreeToggle<Cr>',
		{ desc = 'open undotree', silent = true },
	})
	m({
		'n',
		'U',
		'<Cmd>redo<Cr>',
		{ desc = 'redo', silent = true },
	})
	m({
		'n',
		']u',
		'<Cmd>later<Cr>',
		{ desc = 'Previous undotree state', silent = true },
	})
	m({
		'n',
		'[u',
		'<Cmd>earlier<Cr>',
		{ desc = 'Next undotree state', silent = true },
	})
end

M.init = function()
	undo()
	vim.g.Undotree_CustomMap = undotree
end

return M
