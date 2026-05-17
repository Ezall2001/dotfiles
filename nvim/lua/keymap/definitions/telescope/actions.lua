local a = require('telescope.actions')
local actions_transformer = require('keymap.definitions.telescope.lib.actions_transfromer')
local l = require('telescope.actions.layout')
local open_with_trouble = require('trouble.sources.telescope').open

local actions_group = {}

actions_group.motions = {
	{
		action = a.move_selection_next,
		key = { n = 'j', i = '<C-n>' },
	},
	{
		action = a.move_selection_previous,
		key = { n = 'k', i = '<C-p>' },
	},
	{
		action = a.move_to_bottom,
		key = { n = 'J' },
	},
	{
		action = a.move_to_top,
		key = { n = 'K' },
	},
}

actions_group.selection = {
	{
		action = a.toggle_selection + a.move_selection_next,
		key = '<Tab>',
	},
	{
		action = a.toggle_selection + a.move_selection_previous,
		key = '<S-Tab>',
	},
	{
		action = a.select_default,
		key = '<Cr>',
	},
	{
		action = a.select_horizontal,
		key = '<C-v>',
	},
	{
		action = a.select_vertical,
		key = '<C-z>',
	},
}

actions_group.preview = {
	{
		action = l.toggle_preview,
		key = '<C-w>',
	},
	{
		action = a.preview_scrolling_down,
		key = '<C-d>',
	},
	{
		action = a.preview_scrolling_up,
		key = '<C-u>',
	},
	{
		action = a.preview_scrolling_left,
		key = '<C-h>',
	},
	{
		action = a.preview_scrolling_right,
		key = '<C-l>',
	},
}

actions_group.other = {
	{
		action = a.close,
		key = { n = '<esc>', i = '<M-x>' },
	},
	{
		action = open_with_trouble,
		key = '<C-t>',
	},
	{
		action = a.which_key,
		key = { n = '?' },
	},
	{
		action = a.to_fuzzy_refine,
		key = '<C-f>',
	},
}

local actions = {}
for _, group_actions in pairs(actions_group) do
	actions = vim.list_extend(actions, group_actions)
end

return actions_transformer(actions)
