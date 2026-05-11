local completion = {
	enable = true,
	autoRequire = true,
	displayContext = 5,
	callSnippet = 'Replace',
	keywordSnippet = 'Replace',
	postfix = '@',
	requireSeparator = '.',
	showParams = true,
	showWord = false,
	workspaceWord = false,
}

local language = {
	completeAnnotation = true,
	fixIndent = true,
}

local semantic = {
	enable = true,
	variable = true,
	keyword = false,
	annotation = true,
}

local hint = {
	enable = true,
	arrayIndex = 'Disable',
	await = true,
	awaitPropagate = false,
	paramName = 'All',
	paramType = false,
	semicolon = 'SameLine',
	setType = false,
}

local diagnostics = {
	enable = true,
	disable = {},
	disableScheme = { 'git' },
	ignoredFiles = 'Opened',
	libraryFiles = 'Opened',
	unusedLocalExclude = {},
	workspaceDelay = 3000,
	workspaceEvent = 'onSave',
	workspaceRate = 100,
}

local hover = {
	enable = true,
	enumsLimit = 5,
	expandAlias = true,
	previewFields = 50,
	previewNumber = true,
	previewString = true,
	viewStringMax = 1000,
}

local type = {
	castNumberToInteger = false,
	checkTableShape = false,
	inferParamType = true,
	inferTableSize = 20,
	weakNilCheck = false,
	weakUnionCheck = false,
}

local typeFormat = {
	auto_complete_end = 'true',
	auto_complete_table_sep = 'true',
	format_line = 'true',
}

local workspace = {
	checkThirdParty = 'Ask',
	ignoreSubmodules = true,
	maxPreload = 5000,
	preloadFileSize = 500,
	useGitIgnore = true,
}

local config = {
	Lua = {
		--codeLens = { enable = false },
		--signatureHelp = { enable = true },
		--format = { enable = false },
		--completion = completion,
		--diagnostics = diagnostics,
		--hint = hint,
		--hover = hover,
		--language = language,
		--semantic = semantic,
		--type = type,
		--typeFormat = typeFormat,
		--workspace = workspace,
	},
}

return config
