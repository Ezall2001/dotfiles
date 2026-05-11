---@diagnostic disable: missing-fields

local M = {}

---@type trouble.Mode
local references = {
	mode = 'lsp_references',
	desc = 'references',
}

M.references = function()
	require('trouble').open(references)
end

return M
