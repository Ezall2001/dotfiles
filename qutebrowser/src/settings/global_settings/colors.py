def setup(c):
	palette = {
		'dark_red': '#D00050',
		'red': '#FF2E66',
		'light_red': '#FF5C87',
		'dark_yellow': '#ADBA17',
		'yellow': '#f1fa8c',
		'light_yellow': '#ffffa5',
		'dark_green': '#008B48',
		'green': '#50fa7b',
		'light_green': '#69ff94',
		'dark_purple': '#371D49',
		'purple': '#bd93f9',
		'light_purple': '#d6acff',
		'pink': '#ff7aca',
		'light_pink': '#fc9cd2',
		'dark_cyan': '#00BEDB',
		'cyan': '#8be9fd',
		'light_cyan': '#a4ffff',
		'orange': '#ffb86c',
		'dark_beige': '#533f4b',
		'beige': '#B78F71',
		'light_beige': '#ead3c1',
		'white': '#fff0f9',
		'light_white': '#ffffff',
		'black': '#21222c',
		'light_black': '#6272a4',
		'background': '#0d0b19',
		'grey': ['#44475a', '#282a36'],
	}

	c.colors.webpage.bg = palette['background']
	c.colors.tooltip.bg = palette['black']
	c.colors.tooltip.fg = palette['orange']

	c.colors.contextmenu.disabled.bg = palette['black']
	c.colors.contextmenu.disabled.fg = palette['light_black']
	c.colors.contextmenu.menu.bg = palette['black']
	c.colors.contextmenu.menu.fg = palette['white']
	c.colors.contextmenu.selected.bg = palette['light_black']
	c.colors.contextmenu.selected.fg = palette['light_white']

	c.colors.completion.category.bg = palette['black']
	c.colors.completion.category.border.bottom = palette['red']
	c.colors.completion.category.border.top = palette['black']
	c.colors.completion.category.fg = palette['red']
	c.colors.completion.even.bg = palette['black']
	c.colors.completion.odd.bg = palette['grey'][1]
	c.colors.completion.fg = palette['white']
	c.colors.completion.item.selected.bg = palette['light_black']
	c.colors.completion.item.selected.border.bottom = palette['light_black']
	c.colors.completion.item.selected.border.top = palette['light_black']
	c.colors.completion.item.selected.fg = palette['light_white']
	c.colors.completion.match.fg = palette['purple']
	c.colors.completion.item.selected.match.fg = palette['red']
	c.colors.completion.scrollbar.bg = palette['grey'][1]
	c.colors.completion.scrollbar.fg = palette['light_beige']

	c.colors.downloads.system.fg = 'none'
	c.colors.downloads.system.bg = 'none'
	c.colors.downloads.bar.bg = palette['black']
	c.colors.downloads.error.bg = palette['background']
	c.colors.downloads.error.fg = palette['red']
	c.colors.downloads.start.bg = palette['background']
	c.colors.downloads.stop.bg = palette['background']
	c.colors.downloads.start.fg = palette['white']
	c.colors.downloads.stop.fg = palette['white']

	c.hints.border = f'1px solid {palette["grey"][1]}'
	c.colors.hints.bg = palette['grey'][1]
	c.colors.hints.fg = palette['pink']
	c.colors.hints.match.fg = palette['cyan']

	c.colors.keyhint.bg = palette['black']
	c.colors.keyhint.fg = palette['white']
	c.colors.keyhint.suffix.fg = palette['purple']

	c.colors.messages.error.bg = palette['black']
	c.colors.messages.error.border = palette['black']
	c.colors.messages.error.fg = palette['red']
	c.colors.messages.info.bg = palette['black']
	c.colors.messages.info.border = palette['black']
	c.colors.messages.info.fg = palette['cyan']
	c.colors.messages.warning.bg = palette['black']
	c.colors.messages.warning.border = palette['black']
	c.colors.messages.warning.fg = palette['orange']

	c.colors.prompts.bg = palette['black']
	c.colors.prompts.fg = palette['white']
	c.colors.prompts.border = f'1px solid {palette["grey"][1]}'
	c.colors.prompts.selected.fg = palette['light_white']
	c.colors.prompts.selected.bg = palette['light_black']

	c.colors.statusbar.caret.bg = palette['black']
	c.colors.statusbar.caret.fg = palette['orange']
	c.colors.statusbar.caret.selection.bg = palette['black']
	c.colors.statusbar.caret.selection.fg = palette['purple']
	c.colors.statusbar.command.bg = palette['black']
	c.colors.statusbar.command.fg = palette['pink']
	c.colors.statusbar.command.private.bg = palette['black']
	c.colors.statusbar.command.private.fg = palette['pink']
	c.colors.statusbar.insert.bg = palette['black']
	c.colors.statusbar.insert.fg = palette['green']
	c.colors.statusbar.normal.bg = palette['black']
	c.colors.statusbar.normal.fg = palette['white']
	c.colors.statusbar.passthrough.bg = palette['black']
	c.colors.statusbar.passthrough.fg = palette['yellow']
	c.colors.statusbar.private.bg = palette['black']
	c.colors.statusbar.private.fg = palette['white']
	c.colors.statusbar.progress.bg = palette['grey'][1]
	c.colors.statusbar.url.error.fg = palette['red']
	c.colors.statusbar.url.fg = palette['white']
	c.colors.statusbar.url.hover.fg = palette['cyan']
	c.colors.statusbar.url.success.http.fg = palette['green']
	c.colors.statusbar.url.success.https.fg = palette['green']
	c.colors.statusbar.url.warn.fg = palette['orange']

	c.colors.tabs.indicator.system = 'hsl'
	c.colors.tabs.bar.bg = palette['black']
	c.colors.tabs.even.bg = palette['grey'][0]
	c.colors.tabs.even.fg = palette['white']
	c.colors.tabs.indicator.error = palette['red']
	c.colors.tabs.indicator.start = palette['green']
	c.colors.tabs.indicator.stop = palette['green']
	c.colors.tabs.odd.bg = palette['grey'][0]
	c.colors.tabs.odd.fg = palette['white']
	c.colors.tabs.selected.even.bg = palette['light_black']
	c.colors.tabs.selected.even.fg = palette['white']
	c.colors.tabs.selected.odd.bg = palette['light_black']
	c.colors.tabs.selected.odd.fg = palette['white']
	c.colors.tabs.pinned.even.bg = palette['grey'][0]
	c.colors.tabs.pinned.even.fg = palette['white']
	c.colors.tabs.pinned.odd.bg = palette['grey'][0]
	c.colors.tabs.pinned.odd.fg = palette['white']
	c.colors.tabs.pinned.selected.even.bg = palette['light_black']
	c.colors.tabs.pinned.selected.even.fg = palette['white']
	c.colors.tabs.pinned.selected.odd.bg = palette['light_black']
	c.colors.tabs.pinned.selected.odd.fg = palette['white']
