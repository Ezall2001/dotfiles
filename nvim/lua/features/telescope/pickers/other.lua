local M = {}

M.resume = function()
	require('telescope.builtin').resume()
end

M.select_resume = function()
	require('telescope.builtin').pickers()
end

M.live_grep = function()
	require('telescope').extensions.live_grep_args.live_grep_args({
		disable_coordinates = true,
	})
end

M.visited_files = function()
	require('telescope.builtin').oldfiles({
		only_cwd = true,
	})
end

M.find_files = function()
	require('telescope.builtin').find_files({
		find_command = { 'fd', '--type', 'f', '--strip-cwd-prefix' },
	})
end

M.notifications = function()
	require('telescope').extensions.notify.notify()
end

M.man_pages = function()
	require('telescope.builtin').man_pages({
		sections = { 'ALL' },
	})
end

M.spell = function()
	require('telescope.builtin').spell_suggest()
end

M.cmdline = function()
	require('telescope').extensions.cmdline.cmdline({})
end

return M
