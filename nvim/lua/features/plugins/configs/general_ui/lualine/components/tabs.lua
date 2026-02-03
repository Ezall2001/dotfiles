--#selene: allow(mixed_table)

local i = require('constants.icons')
local o = require('features.oil')

local fmt = function(name, ctx)
	local buflist = vim.fn.tabpagebuflist(ctx.tabnr)
	local winnr = vim.fn.tabpagewinnr(ctx.tabnr)
	local bufnr = buflist[winnr]

	if ctx.filetype == 'oil' then
		return i.file.dir_closed(true) .. o.dir(bufnr)
	elseif ctx.filetype == 'NeogitLogView' then
		return i.file.log(true) .. name
	else
		return i.file.file(true) .. name
	end
end

return {
	'tabs',
	tab_max_length = 40,
	max_length = vim.o.columns,
	mode = 1,
	path = 1,
	use_mode_colors = true,
	show_modified_status = true,
	symbols = {
		modified = i.git.modified(false),
	},

	fmt = fmt,
}
