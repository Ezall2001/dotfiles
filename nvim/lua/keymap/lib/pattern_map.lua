local ku = require("keymap.lib.utils")
local u = require("utils.callback")
local map = require("keymap.lib.map")

local attach_cb = function(keymaps, args)
	local _map = ku.create_map(keymaps)
	_map[4].buffer = args.buf

	for _, m in ipairs(keymaps) do
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
		vim.api.nvim_create_autocmd("BufEnter", {
			pattern = pattern,
			callback = u.mkcb(attach_cb, LM.maps),
		})
	end

	return LM
end

return pattern_mapper
