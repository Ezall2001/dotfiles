---@diagnostic disable: missing-fields

local M = {}

---@type trouble.Mode
local definitions = {
	mode = 'lsp_definitions',
	desc = 'definitions',
	win = { position = 'bottom' },
}

---@type trouble.Mode
local type_definitions = {
	mode = 'lsp_type_definitions',
	desc = 'type definitions',
	win = { position = 'bottom' },
}

M.definitions = function()
	require('trouble').open(definitions)
end

M.type_definitions = function()
	require('trouble').open(type_definitions)
end

return M
