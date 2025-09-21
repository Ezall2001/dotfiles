local lsps = {
	"lua_ls",
	"jsonls",
	"ts_ls",
	"pyright",
}

-- lsps not in mason
local extra_lsps = {
	"nushell",
}

local config = function()
	vim.lsp.config("jsonls", {})
	require("mason-lspconfig").setup()

	for _, lsp in ipairs(extra_lsps) do
		vim.lsp.enable(lsp)
	end
end

local spec = {
	"mason-org/mason-lspconfig.nvim",
	opts = {
		ensure_installed = lsps,
	},
	dependencies = {
		"mason-org/mason.nvim",
		"neovim/nvim-lspconfig",
	},
	config = config,
}

return spec
