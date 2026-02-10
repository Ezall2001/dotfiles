local M = {}

local i = function(icon)
	return function(expand)
		if expand then
			return icon .. ' '
		end
		return icon
	end
end

M.clock = {
	time = i('󰥔'),
	chrono = i('󱎫'),
}

M.git = {
	git = i('󰊢'),
	added = i(''),
	modified = i(''),
	ignored = i(''),
	removed = i(''),
	renamed = i(''),
	file_untracked = i('󱙔'),
	file_staged = i('󰎝'),
	file_modified = i('󱞂'),
	file_deleted = i('󱙒'),
	file_renamed = i('󰚹'),
	conflict = i(''),
}

M.app = {
	bash = i('$'),
	lua = i(''),
}

M.other = {
	horizontal_seperator = i('─'),
	pointer = i(''),
	cmdline = i(''),
	search_down = i(' '),
	search_up = i(' '),
	help = i(''),
	input = i('󰥻'),
	history = i(''),
	autocomplete = i(''),
	install = i(''),
	toggle = { on = i(''), off = i('󰒉') },
	transparent_background = {
		i('▓'),
		i('▒'),
		i('░'),
	},
}

M.file = {
	dir_closed = i(''),
	dir_open = i(''),
	file = i('󰈔'),
	new_file = i(''),
	unknown_file = i('󰡯'),
	read_only = i('󰏮'),
	log = i(''),
}

M.text = {
	section = i('󰚟'),
	fold_open = i(''),
	fold_closed = i(''),
	fold_lines = i('󰡏'),
	tab = i('┃'),
	trail = i('·'),
	multispace = i('···'),
	extends = i(''),
	precedes = i(''),
	conceal = i('󰇘'),
	wrap = i('↪'),
}

M.programming = {
	debug = i(''),
	warn = i(''),
	hint = i('󱩌'),
	info = i('󰋼'),
	error = i(''),
	trace = i(''),
	todo = i(''),
	note = i(''),
	fix = i(''),
	performance = M.clock.chrono,
	test = i('󰙨'),
	hack = i(''),
	array = i(''),
	boolean = i(''),
	class = i('🎩'),
	constant = i('󰏿'),
	constructor = i(''),
	enum = i(''),
	event = i(''),
	field = i('󰐱'),
	['function'] = i('󰡱'),
	interface = i(''),
	key = i(''),
	module = i(''),
	namespace = i('󰦮'),
	null = i('󰟢'),
	number = i('󰎠'),
	object = i(''),
	operator = i(''),
	string = i(''),
	type = i(''),
	variable = i('🌊'),
	text = i(''),
	unit = i(''),
	color = i('󰏘'),
	reference = i('󰓹'),
	keyword = i('󰝨'),
	value = i(''),
	snippet = i(''),
}

M.special = {
	telescope_prompt = i('🐕‍🦺'),
}

return M
