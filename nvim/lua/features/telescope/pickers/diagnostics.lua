local M = {}

M.diagnostics = function()
	require('telescope.builtin').diagnostics({
		sort_by = 'buffer',
		disable_coordinates = true,
	})
end

return M
