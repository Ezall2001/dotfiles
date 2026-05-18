local p = require('features.plugins')
local m = require('keymap.lib').map

local sticky_yank = function()
	local regs = { 'h', 't', 'n' }

	for _, reg in ipairs(regs) do
		m({
			{ 'n', 'v' },
			string.format('gy%s', reg),
			string.format('"%s<Plug>(YankyYank)', reg),
			{ desc = string.format('yank to %s register', reg) },
		})
		m({
			{ 'n', 'v' },
			string.format('gp%s', reg),
			string.format('"%s<Plug>(YankyPutAfter)', reg),
			{ desc = string.format('put after from %s register', reg) },
		})
		m({
			{ 'n', 'v' },
			string.format('gP%s', reg),
			string.format('"%s<Plug>(YankyPutAfter)', reg),
			{ desc = string.format('put after from %s register', reg) },
		})
	end
end

local yank = function()
	m({
		{ 'n', 'v' },
		'y',
		'<Plug>(YankyYank)',
		{ desc = 'yank (preserve cursor pos)' },
	})

	m({
		'n',
		'Y',
		'<Plug>(YankyYank)$',
		{ desc = 'yank to end of line (preserve cursor pos)' },
	})

	m({
		{ 'n', 'v' },
		'Gy',
		[["+<Plug>(YankyYank)]],
		{ desc = 'yank to clipboard' },
	})
	m({
		'n',
		'GY',
		[["+<Plug>(YankyYank)$]],
		{ desc = 'yank to end of line to clipboard' },
	})
end

local put = function()
	m({
		'n',
		'p',
		'<Plug>(YankyPutAfter)',
		{ desc = 'put after cursor' },
	})
	m({
		'n',
		'P',
		'<Plug>(YankyPutBefore)',
		{ desc = 'put before cursor' },
	})
	m({
		'v',
		'p',
		[["_d<Plug>(YankyPutBefore)]],
		{ desc = 'replace selection keeping register content' },
	})

	m({
		'n',
		'Gp',
		'"+<Plug>(YankyPutAfter)',
		{ desc = 'put after cursor from clipboard' },
	})
	m({
		'n',
		'GP',
		'"+<Plug>(YankyPutBefore)',
		{ desc = 'put before cursor from clipboard' },
	})

	m({
		'n',
		'[p',
		'<Plug>(YankyPreviousEntry)',
		{ desc = 'yanky cycle previous entry' },
	})
	m({
		'n',
		']p',
		'<Plug>(YankyNextEntry)',
		{ desc = 'yanky cycle next entry' },
	})
end

local yanky = function()
	local l = require('yanky.textobj').last_put
	m({
		'n',
		'gpv',
		l,
		{ desc = 'yanky select last put' },
	})
end

local telescope = function()
	local t = require('telescope').extensions.yank_history

	m({
		'n',
		'<leader>yt',
		t.yank_history,
		{ desc = 'telescope open yank history' },
	})
end

local M = {}

M.yanky_telescope_picker = function()
	local mapping = require('yanky.telescope.mapping')

	local mappings = {
		default = mapping.put('p'),
		i = {
			['<c-x>'] = mapping.delete(),
		},
		n = {
			p = mapping.put('p'),
			P = mapping.put('P'),
			x = mapping.delete(),
		},
	}

	return mappings
end

M.init = function()
	sticky_yank()
	yank()
	put()
	p.on_plugin_register('yanky', yanky)
	p.on_plugin_register('telescope', telescope)
end

return M
