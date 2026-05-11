local u = require('features.lsp.definitions.harper_ls.utils')

local linters = {
	SpelledNumbers = true,
	AnotherThinkComing = false,
	BoringWords = true,
	UseGenitive = true,
	PossessiveNoun = true,
}

local config = {
	userDictPath = u.get_user_dict_path(),
	workspaceDictPath = u.get_ws_dict_path(),
	fileDictPath = u.get_file_dict_dir_path(),
	ignoredLintsPath = '',
	linters = linters,
	codeActions = { ForceStable = true },
	markdown = { IgnoreLinkTitle = false },
	diagnosticSeverity = 'hint',
	isolateEnglish = false,
	dialect = 'American',
	maxFileLength = 120000,
}

return config
