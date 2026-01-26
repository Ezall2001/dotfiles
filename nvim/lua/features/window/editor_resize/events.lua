local adjust = require('features.window.editor_resize.adjust')
local c = require('features.window.editor_resize.cache')
local cst = require('features.window.consts')
local debounce = require('utils.timing.debounce')

local M = {}

local on_resize_start = function()
	c.cache.locked = true
	local m = require('mini.animate')
	m.config.resize.enable = false
end

local on_resize_end = function()
	local m = require('mini.animate')
	adjust()
	c.cache.locked = false
	m.config.resize.enable = true
	c.update_editor_cache()
	c.update_cache_wins()
end

local on_resize_end_debounced = debounce(on_resize_end, 300, false)
local update_cache_wins_debounced = debounce(c.update_cache_wins, 50, false)

M.on_editor_resize = function()
	on_resize_start()
	on_resize_end_debounced()
end

M.on_win_event = function(args)
	local buf = vim.bo[args.buf]

	if vim.list_contains(cst.IGNORED_BUF_TYPES, buf.buftype) then
		return
	end

	local m = require('mini.animate')
	m.execute_after('resize', update_cache_wins_debounced)
end

return M
