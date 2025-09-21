local p = require("features.plugins")
local o = require("features.oil")

local OIL_KEYMAP_GROUP = vim.api.nvim_create_augroup("oil_keymap", { clear = true })

local all_buf = function()
	vim.keymap.set("n", "-", o.invoke)
end

local oil_buf_only = function(arg)
	local buf = arg.buf
	if vim.bo[arg.buf].filetype ~= "oil" then
		return nil
	end

	local oil = require("oil")
	local a = require("oil.actions")

	vim.keymap.set("n", "-", a.parent.callback, { buffer = buf })
	vim.keymap.set("n", "<C-->", a.open_cwd.callback, { buffer = buf })

	vim.keymap.set("n", "<CR>", a.select.callback, { buffer = buf })
	vim.keymap.set("n", "<C-CR>", a.select_vsplit.callback, { buffer = buf })

	vim.keymap.set("n", "<C-p>", a.preview.callback, { buffer = buf })
	vim.keymap.set("n", "<C-t>", a.toggle_trash.callback, { buffer = buf })
	vim.keymap.set("n", "<C-n>", a.change_sort.callback, { buffer = buf })

	vim.keymap.set("n", "<C-u>", oil.discard_all_changes, { buffer = buf })

	vim.keymap.set("n", "<C-c>", a.open_cmdline.callback, { buffer = buf })
	vim.keymap.set("n", "<C-d>", a.cd.callback, { buffer = buf })
end

local plugin_cb = function(_)
	all_buf()

	vim.api.nvim_create_autocmd("Filetype", {
		group = OIL_KEYMAP_GROUP,
		pattern = "oil",
		callback = oil_buf_only,
	})
end

return function()
	p.on_plugin_register("oil", plugin_cb)
end
