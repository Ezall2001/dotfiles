local M = {}

M.diff = function()
	local d = require('diffview')
	d.open({})
end

M.file_history = function()
	local d = require('diffview')
	d.file_history(nil, {})
end

M.curr_file_history = function()
	local d = require('diffview')
	d.file_history(nil, { vim.fn.expand('%') })
end

M.stash = function()
	local d = require('diffview')
	d.file_history(nil, { '--walk-reflogs', '--range=stash' })
end

M.selection_history = function()
	local d = require('diffview')

	d.file_history({ vim.fn.line('v'), vim.fn.line('.') }, { vim.fn.expand('%') })
end

return M
