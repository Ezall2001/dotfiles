local c = require('cmp')
local formatting = require('features.plugins.configs.lsp.cmp.format')
local k = require('keymap.definitions.lsp')
local override = require('features.plugins.configs.lsp.cmp.overrides')

local performance = {
	debounce = 80,
	throttle = 50,
	fetching_timeout = 200,
	filtering_context_budget = 10,
	confirm_resolve_timeout = 100,
	max_view_entries = 40,
	async_budget = 5,
}

local snippet = {
	expand = function(args)
		require('luasnip').lsp_expand(args.body)
	end,
}

local completion = {
	keyword_length = 1,
	autocomplete = { 'TextChanged', 'InsertEnter' },
}

local matching = {
	disallow_fuzzy_matching = false,
	disallow_fullfuzzy_matching = false,
	disallow_partial_fuzzy_matching = false,
	disallow_partial_matching = false,
	disallow_prefix_unmatching = false,
	disallow_symbol_nonprefix_matching = false,
}

local sources = {
	{ name = 'nvim_lsp' },
	{ name = 'path' },
	{
		name = 'luasnip',
		--TODO: test these
		option = {
			use_show_condition = true,
			show_autosnippets = true,
		},
	},
	{ name = 'buffer' },
}

local view = {
	docs = { auto_open = true },
	entries = {
		name = 'custom',
		selection_order = 'top_down',
		follow_cursor = false,
	},
}

local window = {
	completion = {
		border = 'rounded',
		scrolloff = 3,
		side_padding = 0,
		col_offset = 0,
	},
	documentation = {
		border = 'rounded',
	},
}

local experimental = {
	ghost_text = true,
}

--- @type cmp.ConfigSchema
local conf = {
	enabled = true,
	preselect = 'None',
	performance = performance,
	snippet = snippet,
	completion = completion,
	formatting = formatting,
	matching = matching,
	mapping = k.cmp(),
	sources = sources,
	view = view,
	window = window,
	experimental = experimental,
}

c.setup(conf)
require('features.plugins.configs.lsp.cmp.extra')

override(conf)
