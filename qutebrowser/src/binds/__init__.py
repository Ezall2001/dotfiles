from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI

from lib.binds import Binds

from .definitions import hint, modes, other, readline, tabs, window


def setup(config: ConfigAPI, c: ConfigContainer):
	c.bindings.default = {}
	c.bindings.key_mappings = {}

	tabs.setup()
	window.setup()
	hint.setup()
	other.setup()
	readline.setup()
	modes.setup()

	Binds.apply(config)
	# session-save
	# close
	# try navigate
	# bookmarks / quickmark
	# downloads
	# mode-enter jump_mark
	# marks
	# macros

	# TODO: finish from ZQ
