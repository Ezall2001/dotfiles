---@diagnostic disable: missing-fields

local M = {}

---@type trouble.Mode
local implementations = {
	mode = 'lsp_implementations',
	desc = 'implementations',
	win = {
		position = 'bottom',
	},
}

M.implementations = function()
	require('trouble').open(implementations)
end

return M
