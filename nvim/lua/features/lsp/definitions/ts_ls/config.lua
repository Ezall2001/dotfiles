local M = {}

local preferences = {
	disableSuggestions = false,
	quotePreference = 'single',
	includeCompletionsForModuleExports = true,
	includeCompletionsForImportStatements = true,
	includeCompletionsWithSnippetText = true,
	includeCompletionsWithInsertText = true,
	includeAutomaticOptionalChainCompletions = true,
	includeCompletionsWithClassMemberSnippets = true,
	includeCompletionsWithObjectLiteralMethodSnippets = true,
	useLabelDetailsInCompletionEntries = true,
	allowIncompleteCompletions = true,
	importModuleSpecifierPreference = 'non-relative',
	importModuleSpecifierEnding = 'auto',
	allowTextChangesInNewFiles = true,
	lazyConfiguredProjectsFromExternalProject = false,
	maximumHoverLength = 500,
	organizeImportsIgnoreCase = true,
	organizeImportsCollation = 'unicode',
	organizeImportsLocale = 'en',
	organizeImportsNumericCollation = true,
	organizeImportsAccentCollation = true,
	organizeImportsCaseFirst = false,
	organizeImportsTypeOrder = 'first',
	preferTypeOnlyAutoImports = false,
	providePrefixAndSuffixTextForRename = true,
	provideRefactorNotApplicableReason = true,
	allowRenameOfImportPath = true,
	includePackageJsonAutoImports = 'on',
	interactiveInlayHints = true,
	jsxAttributeCompletionStyle = 'braces',
	displayPartsForJSDoc = true,
	excludeLibrarySymbolsInNavTo = true,
	generateReturnInDocTemplate = true,
	includeInlayParameterNameHints = 'all',
	includeInlayParameterNameHintsWhenArgumentMatchesName = true,
	includeInlayFunctionParameterTypeHints = false,
	includeInlayVariableTypeHints = false,
	includeInlayVariableTypeHintsWhenTypeMatchesName = false,
	includeInlayPropertyDeclarationTypeHints = false,
	includeInlayFunctionLikeReturnTypeHints = false,
	includeInlayEnumMemberValueHints = false,
}

M.init_options = {
	hostInfo = 'neovim',
	completionDisableFilterText = false,
	disableAutomaticTypingAcquisition = false,
	maxTsServerMemory = 4096, --4GB
	supportsMoveToFileCodeAction = true,
	preferences = preferences,
}

M.options = {
	typescript = {
		implementationsCodeLens = { enabled = false },
		referencesCodeLens = { enabled = false },
		completions = { completeFunctionCalls = true },
	},
}

return M
