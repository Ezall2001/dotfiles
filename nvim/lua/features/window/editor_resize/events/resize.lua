local adjust = require('features.window.editor_resize.adjust')
local c = require('features.window.editor_resize.cache')
local debounce = require('utils.timing.debounce')

local M = {}

-- EDITOR
local is_editor_resized = function()
	return c.cache.editor.columns ~= vim.o.columns or c.cache.editor.lines ~= vim.o.lines
end

local on_end_editor_resize = function()
	local m = require('mini.animate')

	local ignore_ev = vim.o.eventignore
	vim.opt.eventignore:append('WinResized')
	adjust()

	--NOTE: need some time to finish resizing
	vim.defer_fn(function()
		vim.o.eventignore = ignore_ev
	end, 100)

	m.config.resize.enable = true
	M.editor_resize_started = false
end

local on_end_editor_resize_debounced = debounce(on_end_editor_resize, 300)

local on_start_editor_resize = function()
	local m = require('mini.animate')
	m.config.resize.enable = false
	M.editor_resize_started = true
end

-- WINDOW
local on_win_resize = function()
	local m = require('mini.animate')
	m.execute_after('resize', c.update_layout)
end

local on_win_resize_debounced = debounce(on_win_resize, 50)

-- MAIN
local on_resize = function()
	local is_editor_resized_ = is_editor_resized()

	if is_editor_resized_ and not M.editor_resize_started then
		on_start_editor_resize()
		on_end_editor_resize_debounced()
	elseif is_editor_resized_ and M.editor_resize_started then
		on_end_editor_resize_debounced()
	elseif not (is_editor_resized_ or M.editor_resize_started) then
		on_win_resize_debounced()
	end

	if is_editor_resized_ then
		c.update_editor()
	end
end

return on_resize
