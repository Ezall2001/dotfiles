--#selene: allow(mixed_table)
local i = require('constants.icons')
local o = i.other

--- @type NoiceFormat|string
local format = {
	{
		'{progress} ',
		key = 'progress.percentage',
		contents = {
			{ '{data.progress.message} ' },
		},
	},
	'({data.progress.percentage}%) ',
	{ '{spinner} ', hl_group = 'NoiceLspProgressSpinner' },
	{ '{data.progress.title} ', hl_group = 'NoiceLspProgressTitle' },
	{ '{data.progress.client} ', hl_group = 'NoiceLspProgressClient' },
}

--- @type NoiceFormat|string
local format_done = {
	{ o.toggle.on(true), hl_group = 'NoiceLspProgressSpinner' },
	{ '{data.progress.title} ', hl_group = 'NoiceLspProgressTitle' },
	{ '{data.progress.client} ', hl_group = 'NoiceLspProgressClient' },
}

local progress = {
	enabled = true,
	format = format,
	format_done = format_done,
	throttle = 1000 / 60,
	view = 'mini',
}

return progress
