local c = require('features.window.editor_resize.cache')
local editor_ev = require('features.window.editor_resize.events.editor')
local p = require('features.plugins')
local window_ev = require('features.window.editor_resize.events.window')

local init = function()
	c.update_editor()
	c.update_layout()

	vim.api.nvim_create_autocmd('VimResized', {
		callback = editor_ev.on_resize,
	})

	vim.api.nvim_create_autocmd({ 'WinNew', 'WinClosed' }, {
		callback = window_ev.on_open_close,
	})

	vim.api.nvim_create_autocmd('WinResized', {
		callback = window_ev.on_resize,
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('mini_animate', init)
end

return M
