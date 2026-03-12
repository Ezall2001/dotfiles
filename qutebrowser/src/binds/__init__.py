from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI

from lib.binds import Binds

from .definitions import hint, modes, other, readline, tabs, window, yank


def setup(config: ConfigAPI, c: ConfigContainer):
	c.bindings.default = {}
	c.bindings.key_mappings = {}

	tabs.setup()
	window.setup()
	hint.setup()
	other.setup()
	yank.setup()
	readline.setup()
	modes.setup()

	# TODO: caret, normal

	Binds.apply(config)

	# selection-flow
	# try navigate
	# bookmarks / quickmark
	# downloads
	# marks
	# macros
