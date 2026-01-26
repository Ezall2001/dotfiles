local analysis = {
	autoSearchPaths = true,
	autoImportCompletions = true,
	diagnosticMode = 'openFilesOnly',
	logLevel = 'information',
	useTypingExtensions = false,
	fileEnumerationTimeout = 30,
	autoFormatStrings = true,
	inlayHints = {
		callArgumentNames = true,
		callArgumentNamesMatching = false,
		variableTypes = false,
		functionReturnTypes = true,
		genericTypes = true,
	},
}

local config = {
	basedpyright = {
		disableLanguageServices = false,
		disableOrganizeImports = true,
		disableTaggedHints = false,
		analysis = analysis,
	},
}

return config
