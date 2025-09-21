local const = require("constants")
local lib = require("features.window.winmove")

local panes = function()
	-- create/destroy
	vim.keymap.set(const.all_map_modes, "<M-v>", vim.cmd.split, { desc = "split tab vertically" })
	vim.keymap.set(const.all_map_modes, "<M-z>", vim.cmd.vsplit, { desc = "split tab horizontally" })
	vim.keymap.set(const.all_map_modes, "<M-x>", vim.cmd.quit, { desc = "quit current pane" })

	-- focus
	vim.keymap.set(
		const.all_map_modes,
		"<M-l>",
		"<ESC>:TmuxNavigateRight<CR>",
		{ desc = "focus right pane", silent = true }
	)
	vim.keymap.set(
		const.all_map_modes,
		"<M-h>",
		"<ESC>:TmuxNavigateLeft<CR>",
		{ desc = "focus left pane", silent = true }
	)
	vim.keymap.set(
		const.all_map_modes,
		"<M-k>",
		"<ESC>:TmuxNavigateUp<CR>",
		{ desc = "focus upper pane", silent = true }
	)
	vim.keymap.set(
		const.all_map_modes,
		"<M-j>",
		"<ESC>:TmuxNavigateDown<CR>",
		{ desc = "focus bottom pane", silent = true }
	)
	vim.keymap.set(
		const.all_map_modes,
		"<S-M-o>",
		":TmuxNavigatePrevious<CR>",
		{ desc = "focus previous pane", silent = true }
	)

	-- swap
	vim.keymap.set(const.all_map_modes, "<M-L>", lib.swap(nil, { "l" }), { desc = "swap with right pane" })
	vim.keymap.set(const.all_map_modes, "<M-H>", lib.swap(nil, { "h" }), { desc = "swap with left pane" })
	vim.keymap.set(const.all_map_modes, "<M-J>", lib.swap(nil, { "j" }), { desc = "swap with upper pane" })
	vim.keymap.set(const.all_map_modes, "<M-K>", lib.swap(nil, { "k" }), { desc = "swap with bottom pane" })

	-- resize
	vim.keymap.set(const.all_map_modes, "<M-C-l>", lib.resize(nil, { "l", 5 }), { desc = "rezise width" })
	vim.keymap.set(const.all_map_modes, "<M-C-h>", lib.resize(nil, { "h", 5 }), { desc = "rezise width" })
	vim.keymap.set(const.all_map_modes, "<M-C-j>", lib.resize(nil, { "j", 3 }), { desc = "rezise height" })
	vim.keymap.set(const.all_map_modes, "<M-C-k>", lib.resize(nil, { "k", 3 }), { desc = "rezise height" })
	vim.keymap.set(
		const.all_map_modes,
		"<M-C-r>",
		"<ESC>:wincmd =<CR>",
		{ desc = "equalize window sizes", silent = true }
	)
end

return panes
