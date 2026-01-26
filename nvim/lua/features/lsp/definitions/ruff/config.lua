local config = {
	configurationPreference = 'filesystemFirst',
	lineLength = nil,
	fixAll = true,
	organizeImports = true,
	showSyntaxErrors = true,
	logLevel = 'info',
}

config.codeActions = {
	disableRuleComment = { enable = true },
	fixViolation = { enable = true },
}

config.lint = {
	enable = true,
}

config.format = {
	backend = 'internal',
}

return config
