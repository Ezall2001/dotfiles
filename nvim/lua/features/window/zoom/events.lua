local cache = require('features.window.zoom.cache').cache
local cst = require('features.window.zoom.consts')
local z = require('features.window.zoom.actions')

local M = {}

M.break_zoom = function()
	local state = cache.state
	if state == cst.ZOOM_STATE.zoomed then
		z.end_zoom()
	end
end

return M
