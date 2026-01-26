---@diagnostic disable: missing-fields

local M = {}

---@type trouble.Mode
local diagnostics = {
	mode = "diagnostics",
	desc = "diagnostics",
	win = {
		position = "bottom",
	},
}

M.diagnostics = function()
	require("trouble").open(diagnostics)
end

return M
