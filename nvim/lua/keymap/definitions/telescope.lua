local action = function(action)
	return function()
		local builtin = require("telescope.builtin")
		return builtin[action]()
	end
end

local telescope = function()
	vim.keymap.set("n", "<Leader>ff", action("find_files"), { desc = "telescope find files" })
	vim.keymap.set("n", "<Leader>fh", action("help_tags"), { desc = "telescope find help tags" })
	vim.keymap.set("n", "<Leader>fg", action("live_grep"), { desc = "telescope live grep" })
end

return telescope
