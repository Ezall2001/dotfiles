local c = require("constants")
local o = require("oil-lsp-diagnostics")

local i = c.icons.programming

local conf = {
	diagnostic_colors = {
		error = "DiagnosticError",
		warn = "DiagnosticWarn",
		info = "DiagnosticInfo",
		hint = "DiagnosticHint",
	},
	diagnostic_symbols = {
		error = i.error(),
		warn = i.warn(),
		info = i.info(),
		hint = i.hint(),
	},
}

o.setup(conf)
