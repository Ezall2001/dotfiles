from . import colors, content, fonts, general, hints, input, qt, tabs, ui


def setup(c):
	fonts.setup(c)
	colors.setup(c)
	general.setup(c)
	qt.setup(c)
	input.setup(c)
	tabs.setup(c)
	ui.setup(c)
	content.setup(c)
	hints.setup(c)
