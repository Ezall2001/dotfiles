local t = require("nvim-treesitter.configs")

local syntaxes = { "jsonc", "vim", "regex", "lua", "bash", "markdown", "markdown_inline", "typst" }

local conf = {
	ignore_install = {},
	modules = {},
	sync_install = true,
	parser_install_dir = nil,
	ensure_installed = syntaxes,
	auto_install = true,
	highlight = { enable = true },
	indent = { enable = true },
}

t.setup(conf)
