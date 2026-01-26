--#selene: allow(mixed_table)

local specs = {
	{ 'tpope/vim-obsession', name = 'obsession' },
	{ 'folke/lazydev.nvim', name = 'lazydev', ft = 'lua' },
	{ 'vuciv/golf', name = 'golf' },
	{
		'chomosuke/typst-preview.nvim',
		name = 'typst_preview',
		ft = 'typst',
		version = '1.*',
	},
}

return specs
