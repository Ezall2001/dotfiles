local spec = {
	"JezerM/oil-lsp-diagnostics.nvim",
	dependencies = { "stevearc/oil.nvim" },
	opts = {
		diagnostic_colors = {
			error = "DiagnosticError",
			warn = "DiagnosticWarn",
			info = "DiagnosticInfo",
			hint = "DiagnosticHint",
		},
		diagnostic_symbols = {
			error = "",
			warn = "",
			info = "",
			hint = "󰌶",
		},
	},
}

return spec
