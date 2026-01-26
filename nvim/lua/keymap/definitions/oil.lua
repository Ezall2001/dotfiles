--#selene: allow(mixed_table)

local o = require('features.oil')
local p = require('features.plugins')

local discard_changes_cb = function()
	require('oil').discard_all_changes()
end

local normal_buf = function()
	vim.keymap.set('n', '-', o.invoke)
end

local oil_buf = {
	['-'] = { 'actions.parent', mode = 'n' },
	['<C-->'] = { 'actions.open_cwd', mode = 'n' },
	['<CR>'] = { 'actions.select', mode = 'n' },
	['<C-z>'] = { 'actions.select', mode = 'n', opts = { vertical = true } },
	['<C-v>'] = { 'actions.select', mode = 'n', opts = { horizontal = true } },
	['<C-p>'] = { 'actions.preview', mode = 'n' },
	['<C-t>'] = { 'actions.toggle_trash', mode = 'n' },
	['<C-n>'] = { 'actions.change_sort', mode = 'n' },
	['<C-u>'] = { p.on_plugin_register('oil', discard_changes_cb), mode = 'n' },
	['<C-m>'] = { 'actions.open_cmdline', mode = 'n' },
	['<C-d>'] = { 'actions.cd', mode = 'n' },
}

return {
	init = function()
		p.on_plugin_register('oil', normal_buf)
	end,
	oil_buf = oil_buf,
}
