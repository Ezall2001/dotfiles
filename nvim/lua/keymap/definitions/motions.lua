local motions = function()
	vim.keymap.set("n", "<C-d>", "<C-d>zz")
	vim.keymap.set("n", "<C-u>", "<C-u>zz")
	vim.keymap.set("n", "<C-k>", "<C-y>k")
	vim.keymap.set("n", "<C-j>", "<C-e>j")
end

return motions
