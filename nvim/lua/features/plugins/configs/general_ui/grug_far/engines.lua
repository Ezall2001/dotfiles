local ripgrep = {
	path = 'rg',
	extraArgs = '',
	showReplaceDiff = true,
	placeholders = {
		enabled = true,
		search = 'get good at regex btw',
		replacement = '${n} for capture groups',
		filesFilter = 'glob paths (one per line) (! for negatives)',
		flags = 'important ones: --help --ignore-case --replace --multiline',
		paths = 'normal paths seperated by space (special syms are expanded)',
	},
	defaults = {
		search = nil,
		replacement = nil,
		filesFilter = nil,
		flags = nil,
		paths = nil,
	},
}
local astgrep = {
	path = 'ast-grep',
	extraArgs = '',
	placeholders = {
		enabled = true,
		search = 'e.g. $A && $A()   foo.bar($$$ARGS)   $_FUNC($_FUNC)',
		replacement = 'e.g. $A?.()   blah($$$ARGS)',
		filesFilter = 'e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line, filters via ripgrep)',
		flags = 'e.g. --help (-h) --debug-query=ast --rewrite= (empty replace)',
		paths = 'e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config',
	},
	defaults = {
		search = nil,
		replacement = nil,
		filesFilter = nil,
		flags = nil,
		paths = nil,
	},
}
local astgrep_rules = {
	path = 'ast-grep',
	extraArgs = '',
	languageGlobs = {},
	placeholders = {
		enabled = true,
		rules = 'e.g. id: my_rule_1 \\n language: lua\\nrule: \\n  pattern: await $A',
		filesFilter = 'e.g. *.lua   *.{css,js}   **/docs/*.md   (specify one per line, filters via ripgrep)',
		flags = 'e.g. --help (-h) --debug-query=ast',
		paths = 'e.g. /foo/bar   ../   ./hello\\ world/   ./src/foo.lua   ~/.config',
	},
	defaults = {
		rules = nil,
		filesFilter = nil,
		flags = nil,
		paths = nil,
	},
}

return {
	['astgrep-rules'] = astgrep_rules,
	astgrep = astgrep,
	ripgrep = ripgrep,
}
