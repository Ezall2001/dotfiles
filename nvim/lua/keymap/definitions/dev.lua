local dev = function()
	vim.keymap.set("n", "<M-d>r", require("commands.dev.source_curr"))
end

return dev
