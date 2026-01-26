local image_previewer = require('features.telescope.previewers.image')

local previewer = function(filepath, bufnr, opts)
	local previewers = require('telescope.previewers')

	return image_previewer(filepath, bufnr) or previewers.buffer_previewer_maker(filepath, bufnr, opts)
end

return previewer
