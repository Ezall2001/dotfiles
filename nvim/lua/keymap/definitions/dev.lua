local p = require('features.plugins')
local m = require('keymap.lib').map
local d = require('features.dev')
local pr = require('features.project')
local u = require('utils.callback')

local project = function()
	m({
		'n',
		'<Leader>/pc',
		pr.create,
		{ desc = 'create project (.nivm)' },
	})
	m({
		'n',
		'<Leader>/pd',
		pr.delete,
		{ desc = 'delete project (.nvim)' },
	})
end

local other = function()
	m({
		'n',
		'g/m',
		'<C-]>',
		{ desc = 'go to tag' },
	})

	m({
		'n',
		'g/e',
		d.exec.exec_file,
		{ desc = 'exec current buffer' },
	})
	m({
		'x',
		'g/e',
		d.exec.exec_selection,
		{ desc = 'exec selection' },
	})
end

local telescope = function()
	local t = require('features.telescope').pickers.dev

	m({
		'n',
		'<leader>/h',
		t.help,
		{ desc = 'telescope find help tags' },
	})

	m({
		'n',
		'<leader>/i',
		t.highlights,
		{ desc = 'telescope list highlights' },
	})

	m({
		'n',
		'<leader>/a',
		t.autocommands,
		{ desc = 'telescope list autocommands' },
	})

	m({
		'n',
		'<leader>/kb',
		u.mkcb(t.keymaps, true),
		{ desc = 'telescope list buffer keymaps' },
	})

	m({
		'n',
		'<leader>/kw',
		u.mkcb(t.keymaps, false),
		{ desc = 'telescope list workspace keymaps' },
	})
end

local M = {}

M.init = function()
	project()
	other()
	p.on_plugin_register('telescope', telescope)
end

return M
