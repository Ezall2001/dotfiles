local M = {}

M.MARGIN_W = 5
M.MARGIN_H = 1

M.ZOOM_STATE = {
	no_zoom = 1,
	zoom_enter = 2,
	zoomed = 3,
}

M.BREAK_ZOOM_ON_EV = {
	'WinEnter',
	'WinLeave',
	'WinResized',
	'WinClosed',
	'WinNew',
}

return M
