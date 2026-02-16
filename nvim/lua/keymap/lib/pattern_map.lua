local ku = require('keymap.lib.utils')
local map = require('keymap.lib.map')
local u = require('utils.callback')

local attach_cb = function(keymaps, args)
	for _, m in ipairs(keymaps) do
		local _map = ku.create_map(m)
		_map[4].buffer = args.buf
		map(m)
	end
end

local pattern_mapper = function(pattern)
	local LM = {}

	LM.maps = {}

	setmetatable(LM, {
		__call = function(self, params)
			table.insert(self.maps, params)
		end,
	})

	LM.attach = function()
		vim.api.nvim_create_autocmd('BufEnter', {
			pattern = pattern,
			callback = u.mkcb(attach_cb, LM.maps),
		})
	end

	return LM
end

return pattern_mapper
