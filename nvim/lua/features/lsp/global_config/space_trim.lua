local space_trim_formatter = function()
	local m = require('mini.trailspace')
	m.trim()
	m.trim_last_lines()
end

return space_trim_formatter
