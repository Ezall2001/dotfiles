local i = require('constants.icons').text
local o = require('origami')

local config = {
	useLspFoldsWithTreesitterFallback = {
		enabled = true,
		foldmethodIfNeitherIsAvailable = 'indent', ---@type string|fun(bufnr: number): string
	},
	pauseFoldsOnSearch = true,
	foldtext = {
		enabled = true,
		padding = 3,
		lineCount = {
			template = i.fold_lines(true) .. '%d',
			hlgroup = 'Comment',
		},
		diagnosticsCount = true,
		gitsignsCount = true,
	},
	autoFold = {
		enabled = true,
		kinds = { 'imports' }, ---@type lsp.FoldingRangeKind[]
	},
	foldKeymaps = {
		setup = true,
		closeOnlyOnFirstColumn = false,
		scrollLeftOnCaret = false,
	},
}

o.setup(config)
