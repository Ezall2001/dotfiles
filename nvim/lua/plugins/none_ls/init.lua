local kdl = require("plugins.none_ls.kdl")

local config = function()
	local null_ls = require("null-ls")

	null_ls.setup({
		debug = true,
		log_level = "warn",
		sources = {
			--null_ls.builtins.completion.spell,
			--null_ls.builtins.formatting.shellharden,
			--null_ls.builtins.formatting.trim_whitespace,
			--null_ls.builtins.formatting.trim_newlines,
			null_ls.builtins.formatting.stylua,
			kdl(),
		},
	})
end

local spec = {
	"nvimtools/none-ls.nvim",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		--border: ''
		--diagnostic_format
		--
	},
	config = config,
}

return spec
