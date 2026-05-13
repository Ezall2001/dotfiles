local p = require('features.plugins')

local calls = require('keymap.definitions.lsp.calls')
local definitions = require('keymap.definitions.lsp.definitions')
local diagnostics = require('keymap.definitions.lsp.diagnostics')
local hover = require('keymap.definitions.lsp.hover')
local implementations = require('keymap.definitions.lsp.implementations')
local imports = require('keymap.definitions.lsp.imports')
local luasnip = require('keymap.definitions.lsp.luasnip')
local other = require('keymap.definitions.lsp.other')
local references = require('keymap.definitions.lsp.references')
local symbols = require('keymap.definitions.lsp.symbols')
local type_hierarchy = require('keymap.definitions.lsp.type_hierarchy')

local M = {}

M.init = function()
	hover()
	type_hierarchy()
	other()

	p.on_plugin_register('luasnip', luasnip.init)

	p.on_plugin_register('telescope', function()
		imports()
	end)

	p.on_plugin_register({ 'telescope', 'trouble' }, function()
		symbols()
		diagnostics()
		calls()
		definitions()
		implementations()
		references()
	end)
end

M.cmp = require('keymap.definitions.lsp.cmp')

return M
