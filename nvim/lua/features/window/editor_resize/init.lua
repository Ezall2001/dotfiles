local c = require('features.window.editor_resize.cache')
local ev = require('features.window.editor_resize.events')
local p = require('features.plugins')

local init = function()
	c.update_editor_cache()

	vim.api.nvim_create_autocmd({ 'WinResized', 'WinNew', 'WinClosed' }, {
		callback = ev.on_win_event,
	})

	vim.api.nvim_create_autocmd('VimResized', {
		callback = ev.on_editor_resize,
	})
end

local M = {}

M.init = function()
	p.on_plugin_register('mini_animate', init)
end

return M
