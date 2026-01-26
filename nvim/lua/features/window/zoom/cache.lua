local c = require('features.window.zoom.consts')

local M = {}

M.cache = {
	state = c.ZOOM_STATE.no_zoom,
	wins = {},
}

return M
