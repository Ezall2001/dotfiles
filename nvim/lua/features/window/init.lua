local cursor = require('features.window.cursor')
local editor_resize = require('features.window.editor_resize')
local jumps = require('features.window.jumps')
local marks = require('features.window.marks')
local scroll = require('features.window.scroll')
local winmove = require('features.window.winmove')
local zoom = require('features.window.zoom')

local M = {}

M.winmove = winmove
M.toggle_zoom = zoom.toggle_zoom
M.cursor = cursor
M.scroll = scroll
M.marks = marks
M.jumps = jumps

M.init = function()
	editor_resize.init()
	zoom.init()
end

return M
