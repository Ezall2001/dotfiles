local M = {
	foldlevel = 0,
}

M.default = {
	layout = 'diff2_horizontal',
	disable_diagnostics = false,
	winbar_info = true,
}

M.merge_tool = {
	layout = 'diff3_mixed',
	disable_diagnostics = false,
	winbar_info = true,
}

M.file_history = {
	layout = 'diff2_horizontal',
	disable_diagnostics = false,
	winbar_info = false,
	pin_local = false,
}

M.cycle_layouts = {
	file_history = { 'diff2_horizontal', 'diff2_vertical', 'diff1_inline' },
	default = { 'diff2_horizontal', 'diff2_vertical', 'diff1_inline' },
	merge_tool = { 'diff3_mixed', 'diff3_horizontal', 'diff3_vertical', 'diff4_mixed', 'diff1_plain' },
}

M.inline = {
	style = 'unified',
	deletion_highlight = 'text',
}

return M
