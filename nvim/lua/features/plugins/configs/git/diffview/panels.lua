local M = {}

M.file_panel = {
	show = true,
	always_show_sections = false,
	show_branch_name = false,
	listing_style = 'list',
	always_show_marks = false,
	mark_placement = 'inline',
	tree_options = {
		flatten_dirs = true,
		folder_statuses = 'only_folded',
		folder_count_style = 'grouped',
		folder_trailing_slash = true,
	},
	list_options = {
		path_style = 'basename',
	},
	win_config = {
		type = 'split',
		position = 'left',
		width = 35,
		win_opts = {},
	},
}

M.file_history_panel = {
	stat_style = 'bar',
	subject_highlight = 'ref_aware',
	commit_subject_max_length = 72,
	show = true,
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
