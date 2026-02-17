local M = {}

M.toggle_cmp_doc = function()
	local c = require('cmp')

	if c.visible_docs() then
		c.close_docs()
	else
		c.open_docs()
	end

	return true
end

M.scroll = function(direction)
	return function()
		require('cmp').scroll_docs(direction)
		return true
	end
end

M.complete_accept = function()
	local c = require('cmp')

	if c.visible() and c.get_selected_entry() ~= nil then
		c.confirm()
	elseif not c.visible() then
		c.complete()
	end
end

return M
