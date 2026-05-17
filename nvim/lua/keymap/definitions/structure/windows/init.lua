local M = {}

M.init = function()
	require('keymap.definitions.structure.windows.focus')()
	require('keymap.definitions.structure.windows.resize')()
	require('keymap.definitions.structure.windows.split')()
	require('keymap.definitions.structure.windows.swap')()
end

return M
