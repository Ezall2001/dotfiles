local t = require('configs.ft_configs.definitions.typst').utils

local lint = {
	enabled = true,
	when = 'onSave',
}

local preview = {
	partialRendering = true,
	refresh = 'onType',
}

local completion = {
	postfix = true,
	postfixUfcs = true,
	postfixUfcsLeft = true,
	postfixUfcsRight = true,
	symbol = 'step',
	triggerOnSnippetPlaceholders = true,
}

local config = {
	compileStatus = 'disable',
	completion = completion,
	exportPdf = 'never',
	formatterMode = 'typstyle',
	formatterIndentSize = 2,
	formatterPrintWidth = 120,
	formatterProseWrap = false,
	lint = lint,
	preview = preview,
	projectResolution = 'singleFile',
	semanticTokens = 'enable',
	systemFonts = true,
	rootPath = t.get_root(),
}

return config
