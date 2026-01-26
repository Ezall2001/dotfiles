local actions_transformer = require('keymap.definitions.telescope.lib.actions_transfromer')
local l = require('telescope-live-grep-args.actions')

local actions = {
	{
		action = l.quote_prompt(),
		key = '<C-k>',
	},
	{
		action = l.quote_prompt({ postfix = ' --iglob ' }),
		key = '<C-i>',
	},
}

return actions_transformer(actions)
