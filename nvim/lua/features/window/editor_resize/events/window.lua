local c = require('features.window.editor_resize.cache')
local cst = require('features.window.consts')
local on_resize = require('features.window.editor_resize.events.resize')

local M = {}

local is_invalid_win = function(args)
	local buf = vim.bo[args.buf]
	return vim.list_contains(cst.IGNORED_BUF_TYPES, buf.buftype)
end

M.on_resize = function(args)
	if is_invalid_win(args) then
		return
	end

	on_resize()
end

M.on_open_close = function(args)
	if is_invalid_win(args) then
		return
	end

	local m = require('mini.animate')
	m.execute_after('resize', c.update_layout)
end

return M
