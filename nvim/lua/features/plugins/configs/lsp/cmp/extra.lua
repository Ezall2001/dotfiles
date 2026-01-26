local c = require('cmp')

c.setup.cmdline({ '/', '?' }, {
	sources = {
		{ name = 'buffer' },
	},
})

c.setup.cmdline(':', {
	sources = c.config.sources({
		{ name = 'path' },
	}, {
		{ name = 'cmdline' },
	}),
})
