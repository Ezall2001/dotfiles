local M = {}

M.file_panel = {
	show = true,
	always_show_sections = true,
	show_branch_name = false,
	listing_style = 'list',
	tree_options = {
		flatten_dirs = true,
		folder_statuses = 'only_folded',
	},
	win_config = {
		position = 'left',
		width = 35,
		win_opts = {},
	},
}

M.file_history_panel = {
	stat_style = 'bar',
	commit_subject_max_length = 72,
	date_format = 'auto',
	commit_format = {
		'status',
		'files',
		'stats',
		'hash',
		'reflog',
		'ref',
		'subject',
		'author',
		'date',
	},
	---TODO: test this
	log_options = {
		git = {
			single_file = {
				diff_merges = 'combined',
			},
			multi_file = {
				diff_merges = 'first-parent',
			},
		},
	},
	win_config = {
		position = 'bottom',
		height = 16,
		win_opts = {},
	},
}

M.commit_log_panel = {
	win_config = {},
}

return M
