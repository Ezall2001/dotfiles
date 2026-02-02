local i = require('constants.icons')
local o = require('oil-git')

local conf = {
	debounce_ms = 50,
	show_file_highlights = true,
	show_directory_highlights = true,
	show_file_symbols = true,
	show_directory_symbols = true,
	show_ignored_files = false,
	show_ignored_directories = false,
	symbol_position = 'eol',
	ignore_gitsigns_update = false,
	debug = false,

	symbols = {
		file = {
			added = i.git.file_staged(true),
			modified = i.git.file_modified(true),
			renamed = i.git.file_renamed(true),
			deleted = i.git.file_deleted(true),
			copied = i.git.file_staged(true),
			conflict = i.git.conflict(true),
			untracked = i.git.file_untracked(true),
			ignored = i.git.ignored(true),
		},
		directory = {
			added = i.git.file_staged(true),
			modified = i.git.file_modified(true),
			renamed = i.git.file_renamed(true),
			deleted = i.git.file_deleted(true),
			copied = i.git.file_staged(true),
			conflict = i.git.conflict(true),
			untracked = i.git.file_untracked(true),
			ignored = i.git.ignored(true),
		},
	},

	highlights = {
		OilGitAdded = { fg = '#a6e3a1' },
		OilGitModified = { fg = '#f9e2af' },
		OilGitRenamed = { fg = '#cba6f7' },
		OilGitDeleted = { fg = '#f38ba8' },
		OilGitCopied = { fg = '#cba6f7' },
		OilGitConflict = { fg = '#fab387' },
		OilGitUntracked = { fg = '#89b4fa' },
		OilGitIgnored = { fg = '#6c7086' },
	},
}

o.setup(conf)
