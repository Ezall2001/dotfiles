local config = function()
	local ts_config = require("nvim-treesitter.configs")

	ts_config.setup({
		ensure_installed = { "jsonc", "vim", "regex", "lua", "bash", "markdown", "markdown_inline" },
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	})
end

local spec = {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = config,
}

return spec
