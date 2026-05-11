local M = {}

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
}

M.cycle_layouts = {
	file_history = { 'diff2_horizontal', 'diff2_vertical' },
	default = { 'diff2_horizontal', 'diff2_vertical' },
	merge_tool = { 'diff3_horizontal', 'diff3_vertical', 'diff3_mixed', 'diff4_mixed', 'diff1_plain' },
}

return M
