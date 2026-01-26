local M = {}

M.help = function()
	require('telescope.builtin').help_tags()
end

M.highlights = function()
	require('telescope.builtin').highlights()
end

M.autocommands = function()
	require('telescope.builtin').autocommands()
end

M.keymaps = function(buf_local)
	require('telescope.builtin').keymaps({
		modes = { 'n', 'i', 'c', 'x' },
		show_plug = true,
		only_buf = buf_local,
	})
end

return M
