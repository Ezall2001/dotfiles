local M = {}

M.init = function()
	require('keymap.definitions.windows.focus')()
	require('keymap.definitions.windows.resize')()
	require('keymap.definitions.windows.split')()
	require('keymap.definitions.windows.swap')()
	require('keymap.definitions.windows.buffer')()
end

return M
