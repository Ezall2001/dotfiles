from qutebrowser.config.config import ConfigContainer
from qutebrowser.config.configfiles import ConfigAPI

from . import global_settings, google_bs


def setup(config: ConfigAPI, c: ConfigContainer):
	global_settings.setup(c)
	google_bs.setup(config)
