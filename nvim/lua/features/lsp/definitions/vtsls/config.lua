local vtsls_shared = {
	format = {
		baseIndentSize = nil,
		indentSize = nil,
		tabSize = nil,
		newLineCharacter = nil,
		convertTabsToSpaces = nil,
		trimTrailingWhitespace = nil,
		indentStyle = nil, -- 0: None 1: Block 2: Smart
	},
}

local vtsls_ts_only = {
	globalTsdk = nil,
}

local vtsls_js_only = {}

local vtsls = {
	autoUseWorkspaceTsdk = true,
	enableMoveToFileCodeAction = true,
	typescript = vim.tbl_deep_extend('force', vtsls_shared, vtsls_ts_only),
	javascript = vim.tbl_deep_extend('force', vtsls_shared, vtsls_js_only),
	experimental = {
		completion = {
			enableServerSideFuzzyMatch = true,
			entriesLimit = nil,
		},
		maxInlayHintLength = 30,
	},
	tsserver = {
		globalPlugins = {},
	},
}

local shared = {
	preferGoToSourceDefinition = false,
	validate = {
		enable = true,
	},
	suggestionActions = {
		enabled = true,
	},
	updateImportsOnFileMove = {
		enabled = 'always',
	},
	referencesCodeLens = {
		enabled = false,
		showOnAllFunctions = false,
	},
	suggest = {
		enabled = true,
		autoImports = true,
		completeFunctionCalls = false,
		paths = true,
		completeJSDocs = true,
		jsdoc = { generateReturns = true },
		includeAutomaticOptionalChainCompletions = true,
		includeCompletionsForImportStatements = true,
		classMemberSnippets = { enabled = true },
	},
	preferences = {
		quoteStyle = 'single',
		importModuleSpecifier = 'shortest',
		importModuleSpecifierEnding = 'auto',
		jsxAttributeCompletionStyle = 'auto',
		autoImportFileExcludePatterns = {},
		autoImportSpecifierExcludeRegexes = {},
		useAliasesForRenames = true,
		renameMatchingJsxTags = true,
		organizeImports = {
			caseSensitivity = 'caseInsensitive',
			typeOrder = 'first',
			unicodeCollation = 'ordinal',
			locale = nil,
			numericCollation = nil,
			accentCollation = nil,
			caseFirst = 'default',
		},
	},
	format = {
		enable = false,
		insertSpaceAfterCommaDelimiter = true,
		insertSpaceAfterConstructor = false,
		insertSpaceAfterSemicolonInForStatements = true,
		insertSpaceBeforeAndAfterBinaryOperators = true,
		insertSpaceAfterKeywordsInControlFlowStatements = true,
		insertSpaceAfterFunctionKeywordForAnonymousFunctions = true,
		insertSpaceBeforeFunctionParenthesis = false,
		insertSpaceAfterOpeningAndBeforeClosingNonemptyParenthesis = false,
		insertSpaceAfterOpeningAndBeforeClosingNonemptyBrackets = false,
		insertSpaceAfterOpeningAndBeforeClosingNonemptyBraces = true,
		insertSpaceAfterOpeningAndBeforeClosingEmptyBraces = true,
		insertSpaceAfterOpeningAndBeforeClosingTemplateStringBraces = false,
		insertSpaceAfterOpeningAndBeforeClosingJsxExpressionBraces = false,
		placeOpenBraceOnNewLineForFunctions = false,
		placeOpenBraceOnNewLineForControlBlocks = false,
		semicolons = 'ignore',
		indentSwitchCase = true,
	},
	inlayHints = {
		parameterNames = {
			enabled = 'all',
			suppressWhenArgumentMatchesName = true,
		},
		parameterTypes = { enabled = false },
		variableTypes = {
			enabled = false,
			suppressWhenTypeMatchesName = true,
		},
		propertyDeclarationTypes = { enabled = false },
		functionLikeReturnTypes = { enabled = false },
	},
}

local ts_only = {
	tsdk = nil,
	npm = nil,
	check = { npmIsInstalled = false },
	disableAutomaticTypeAcquisition = false,
	reportStyleChecksAsWarnings = true,
	locale = 'en',
	implementationsCodeLens = {
		enabled = false,
		showOnInterfaceMethods = false,
		showOnAllClassMethods = false,
	},
	workspaceSymbols = {
		scope = 'allOpenProjects',
		excludeLibrarySymbols = true,
	},
	suggest = {
		objectLiteralMethodSnippets = { enabled = true },
	},
	preferences = {
		includePackageJsonAutoImports = 'on',
		preferTypeOnlyAutoImports = false,
	},
	inlayHints = {
		enumMemberValues = { enabled = false },
	},
	format = {
		insertSpaceAfterTypeAssertion = false,
	},

	tsserver = {
		nodePath = nil,
		useSyntaxServer = 'auto',
		log = 'off',
		maxTsServerMemory = 3072,
		pluginPaths = {},
		watchOptions = {
			watchFile = 'useFsEvents',
			watchDirectory = 'useFsEvents',
			fallbackPolling = 'dynamicPriorityPolling',
			synchronousWatchDirectory = false,
		},
		enableTracing = false,
		experimental = {
			enableProjectDiagnostics = true,
		},
		web = {
			projectWideIntellisense = {
				enabled = true,
				suppressSemanticErrors = false,
			},
			typeAcquisition = { enabled = true },
		},
	},
}

local js_only = {
	suggest = {
		names = true,
	},
}

local ts_js = {
	implicitProjectConfig = {
		module = 'ESNext',
		target = 'ESNext',
		checkJs = true,
		experimentalDecorators = true,
		strictNullChecks = true,
		strictFunctionTypes = true,
		strict = true,
	},
	hover = {
		maximumLength = 500,
	},
}

local M = {}

M.settings = {
	vtsls = vtsls,
	typescript = vim.tbl_deep_extend('force', shared, ts_only),
	javascript = vim.tbl_deep_extend('force', shared, js_only),
	['js/ts'] = ts_js,
}

return M
