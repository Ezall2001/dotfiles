local i = require('import')

local config = {
	picker = 'telescope',
	insert_at_top = true,
	custom_languages = {},
}

i.setup(config)
require('telescope').load_extension('import')
