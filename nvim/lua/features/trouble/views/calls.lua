---@diagnostic disable: missing-fields

local M = {}

---@type trouble.Mode
local incoming_calls = {
	mode = "lsp_incoming_calls",
	title = "Being Called [I]n",
	desc = "incoming calls/IN",
}

---@type trouble.Mode
local outgoing_calls = {
	mode = "lsp_outgoing_calls",
	title = "Calling [O]ut",
	desc = "outgoing calls/OUT",
	win = { position = "bottom" },
}

M.outgoing_calls = function()
	require("trouble").open(outgoing_calls)
end

M.incoming_calls = function()
	require("trouble").open(incoming_calls)
end

return M
