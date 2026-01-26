local cache = require('features.window.zoom.cache').cache
local capture_wins = require('features.window.lib.capture_wins')
local cst = require('features.window.zoom.consts')

local M = {}

M.end_zoom = function()
	for _, win in ipairs(cache.wins) do
		vim.api.nvim_win_set_width(win.id, win.columns)
		vim.api.nvim_win_set_height(win.id, win.lines)
	end
end

local start_zoom = function()
	local w = vim.o.columns
	local h = vim.o.lines
	vim.api.nvim_win_set_width(0, w - cst.MARGIN_W)
	vim.api.nvim_win_set_height(0, h - cst.MARGIN_H)
end

local mark_zoomed = function()
	cache.state = cst.ZOOM_STATE.zoomed
end

local mk_toggle_zoom = function()
	local timer = vim.loop.new_timer()

	if timer == nil then
		vim.notify('could not get timer', vim.diagnostic.severity.ERROR)
		return
	end

	local toggle_zoom = function()
		local state = cache.state

		if state == cst.ZOOM_STATE.zoomed or state == cst.ZOOM_STATE.zoom_enter then
			timer:stop()
			cache.state = cst.ZOOM_STATE.no_zoom
			M.end_zoom()
			return
		end

		cache.state = cst.ZOOM_STATE.zoom_enter

		cache.wins = capture_wins()
		start_zoom()

		timer:start(1000, 0, mark_zoomed)
	end

	return toggle_zoom
end

M.toggle_zoom = mk_toggle_zoom()

return M
