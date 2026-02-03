--#selene: allow(mixed_table)

local i = require('constants.icons')

local g = i.git
local f = i.file

return {
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
