local history_cmd = {
	view = "split",
	opts = { enter = true, format = "details" },
	filter = {
		any = {
			{ event = "notify" },
			{ error = true },
			{ warning = true },
			{ event = "msg_show", kind = { "" } },
			{ event = "lsp",      kind = "message" },
		},
	},
}

local last_cmd = {
	view = "popup",
	opts = { enter = true, format = "details" },
	filter = {
		any = {
			{ event = "notify" },
			{ error = true },
			{ warning = true },
			{ event = "msg_show", kind = { "" } },
			{ event = "lsp",      kind = "message" },
		},
	},
	filter_opts = { count = 1 },
}

local errors_cmd = {
	view = "popup",
	opts = { enter = true, format = "details" },
	filter = { error = true },
	filter_opts = { reverse = true },
}

local all_cmd = {
	view = "split",
	opts = { enter = true, format = "details" },
	filter = {},
}

return {
	history = history_cmd,
	last = last_cmd,
	errors = errors_cmd,
	all = all_cmd,
}
