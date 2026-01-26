local cst = require('features.window.zoom.consts')
local ev = require('features.window.zoom.events')
local z = require('features.window.zoom.actions')

local break_zoom = function()
	vim.api.nvim_create_autocmd(cst.BREAK_ZOOM_ON_EV, {
		callback = ev.break_zoom,
	})
end

local M = {}

M.init = function()
	break_zoom()
end

M.toggle_zoom = z.toggle_zoom

return M
