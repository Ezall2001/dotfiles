from . import content, general, hints, input, qt, tabs, ui


def setup(c):
	general.setup(c)
	qt.setup(c)
	input.setup(c)
	tabs.setup(c)
	ui.setup(c)
	content.setup(c)
	hints.setup(c)
