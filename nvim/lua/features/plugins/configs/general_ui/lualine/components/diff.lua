--#selene: allow(mixed_table)

local i = require('constants.icons').git

return {
	'diff',
	colored = true,
	symbols = {
		added = i.added(true),
		modified = i.modified(true),
		removed = i.removed(true),
	},
}
