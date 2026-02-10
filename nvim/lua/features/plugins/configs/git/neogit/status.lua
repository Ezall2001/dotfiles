local i = require('constants.icons')
local g = i.git

local M = {}

M.status = {
	show_head_commit_hash = true,
	recent_commit_count = 10,
	HEAD_padding = 3,
	HEAD_folded = false,
	mode_padding = 1,
	mode_text = {
		M = g.file_modified(false),
		N = g.file_staged(false),
		A = g.file_staged(false),
		D = g.file_deleted(false),
		C = g.file_staged(false),
		U = g.file_modified(false),
		R = g.file_renamed(false),
		T = g.file_modified(false),
		['?'] = g.file_untracked(false),
		DD = string.format('conflict: %s %s', g.file_deleted(true), g.file_deleted(true)),
		AU = string.format('conflict: %s %s', g.file_staged(true), g.file_modified(true)),
		UD = string.format('conflict: %s %s', g.file_modified(true), g.file_deleted(true)),
		UA = string.format('conflict: %s %s', g.file_modified(true), g.file_staged(true)),
		DU = string.format('conflict: %s %s', g.file_deleted(true), g.file_modified(true)),
		AA = string.format('conflict: %s %s', g.file_staged(true), g.file_staged(true)),
		UU = string.format('conflict: %s %s', g.file_modified(true), g.file_modified(true)),
	},
}

M.sections = {
	staged = {
		folded = false,
		hidden = false,
	},
	untracked = {
		folded = false,
		hidden = false,
	},
	unstaged = {
		folded = false,
		hidden = false,
	},
	stashes = {
		folded = true,
		hidden = false,
	},
	unmerged_upstream = {
		folded = true,
		hidden = false,
	},
	recent = {
		folded = false,
		hidden = false,
	},
	sequencer = {
		folded = false,
		hidden = false,
	},
	unpulled_upstream = {
		folded = true,
		hidden = false,
	},
	unpulled_pushRemote = {
		folded = true,
		hidden = false,
	},
	unmerged_pushRemote = {
		folded = true,
		hidden = false,
	},
	rebase = {
		folded = false,
		hidden = false,
	},
}

return M
