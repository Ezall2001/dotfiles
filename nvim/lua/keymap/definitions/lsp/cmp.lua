local keymap_with_fallback = function(f)
	local c = require('cmp')

	return function(fallback)
		local did_exec = false

		if c.visible() and f ~= nil then
			did_exec = f()
		end

		if not did_exec then
			fallback()
		end
	end
end

local cmp = function()
	local c = require('cmp')
	local ca = require('features.cmp').actions

	local abort = keymap_with_fallback(c.abort)
	local next = keymap_with_fallback(c.select_next_item)
	local prv = keymap_with_fallback(c.select_prev_item)
	local scroll_up = keymap_with_fallback(ca.scroll(-1))
	local scroll_down = keymap_with_fallback(ca.scroll(1))

	return {
		['<C-n>'] = c.mapping(next, { 'i', 'c' }),
		['<C-p>'] = c.mapping(prv, { 'i', 'c' }),
		['<esc>'] = c.mapping(abort, { 'i', 'c' }),
		['<C-v>'] = c.mapping(ca.toggle_cmp_doc, { 'i', 'c' }),
		['<C-u>'] = c.mapping(scroll_up, { 'i', 'c' }),
		['<C-d>'] = c.mapping(scroll_down, { 'i', 'c' }),
		['<C-Space>'] = c.mapping(ca.complete_accept, { 'i', 'c' }),
	}
end

return cmp
