local config = require("features.lsp.definitions.harper_ls.config")

local M = {}

local default_ft = {}

M.init = function(ft)
	ft = ft or default_ft

	vim.lsp.config("harper_ls", {
		filetypes = ft,
		settings = { ["harper-ls"] = config },
	})

	vim.lsp.enable("harper_ls")
end

return M
