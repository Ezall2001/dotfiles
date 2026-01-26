local cmdline = require('features.plugins.configs.navigation.telescope.cmdline')
local defaults = require('features.plugins.configs.navigation.telescope.defaults')
local lga = require('features.plugins.configs.navigation.telescope.live_grep_args')

local t = require('telescope')

local conf = {
	defaults = defaults,
	extensions = {
		cmdline = cmdline,
		live_grep_args = lga,
	},
}

t.setup(conf)
t.load_extension('fzf')
t.load_extension('ui-select')
t.load_extension('notify')
t.load_extension('cmdline')
t.load_extension('live_grep_args')
