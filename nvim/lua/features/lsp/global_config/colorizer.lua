local r = require('features.lsp.registry').get_registry()

local colorize = function(buf)
	local ft = vim.bo[buf].filetype

	if r[ft] and r[ft].colorizer == true then
		require('colorizer').attach_to_buffer(buf)
	end
end

return colorize
