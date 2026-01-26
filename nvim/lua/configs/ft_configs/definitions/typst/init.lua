local set_options = require("configs.ft_configs.definitions.typst.options")
local config_lsp = require("configs.ft_configs.definitions.typst.lsp")
local utils = require("configs.ft_configs.definitions.typst.utils")

local M = {}

M.filetypes = { "typst" }
M.utils = utils

M.init = function()
	set_options(M.filetypes)
	config_lsp(M.filetypes)
end

return M
