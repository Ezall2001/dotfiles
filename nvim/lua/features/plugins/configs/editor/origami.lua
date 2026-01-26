local i = require("constants.icons").text
local o = require("origami")

local config = {
	useLspFoldsWithTreesitterFallback = true,
	pauseFoldsOnSearch = true,
	foldtext = {
		enabled = true,
		padding = 3,
		lineCount = {
			template = i.fold_lines(true) .. "%d",
			hlgroup = "Comment",
		},
		diagnosticsCount = true,
		gitsignsCount = true,
	},
	autoFold = {
		enabled = true,
		kinds = { "imports" }, ---@type lsp.FoldingRangeKind[]
	},
	foldKeymaps = {
		setup = true,
		hOnlyOpensOnFirstColumn = true,
	},
}

o.setup(config)
