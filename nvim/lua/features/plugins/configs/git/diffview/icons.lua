local i = require('constants.icons')

local f = i.file
local t = i.text
local o = i.other
local g = i.git
local p = i.programming

local M = {}

M.icons = {
	folder_closed = f.dir_closed(false),
	folder_open = f.dir_open(false),
}

M.signs = {
	fold_closed = t.fold_closed(false),
	fold_open = t.fold_open(false),
	done = o.done(false),
}

M.status_icons = {
	M = g.file_modified(false),
	A = g.file_staged(false),
	D = g.file_deleted(false),
	C = g.file_staged(false),
	U = g.file_modified(false),
	R = g.file_renamed(false),
	T = g.file_modified(false),
	X = p.bug(false),
	B = p.bug(false),
	['?'] = g.file_untracked(false),
	['!'] = g.ignored(false),
}

return M
