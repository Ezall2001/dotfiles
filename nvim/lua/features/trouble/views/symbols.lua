---@diagnostic disable: missing-fields

local M = {}

---@type trouble.Mode
local document_symbols_conf = {
	mode = 'lsp_document_symbols',
	desc = 'document symbols',
}

M.document_symbols = function()
	require('trouble').open(document_symbols_conf)
end

return M
