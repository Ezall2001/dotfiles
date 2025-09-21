local dev = function()
	vim.keymap.set("n", "<M-d>r", require("features.dev.source_curr"))
end

return dev
