--#selene: allow(mixed_table)
local i = require('constants.icons')

local p = i.programming
local g = i.git
local f = i.file

local M = {}

M.diagnostics = {
	'diagnostics',
	colored = true,
	sources = { 'nvim_diagnostic' },
	sections = { 'error', 'warn', 'info', 'hint' },
	symbols = {
		error = p.error(true),
		warn = p.warn(true),
		info = p.info(true),
		hint = p.hint(true),
	},
}

M.diff = {
	'diff',
	colored = true,
	symbols = {
		added = g.added(true),
		modified = g.modified(true),
		removed = g.removed(true),
	},
}

M.filename = {
	'filename',
	path = 4,
	file_status = true,
	newfile_status = false,
	shorting_target = 40,
	symbols = {
		modified = g.file_modified(true),
		readonly = f.read_only(true),
		unnamed = f.unknown_file(true) .. 'no name',
		newfile = f.new_file(true),
	},
}

M.filetype = { 'filetype' }
M.mode = { 'mode' }
M.branch = { 'branch' }
M.location = { 'location' }
M.progress = { 'progress' }

return M
