import sys
import os

from qutebrowser.config.configfiles import ConfigAPI
from qutebrowser.config.config import ConfigContainer

config: ConfigAPI = config # pyright: ignore
c: ConfigContainer = c # pyright: ignore

shared_lib_path = os.path.abspath(
    os.path.join(os.path.dirname(__file__), "../shared"))
sys.path.append(shared_lib_path)

config.source('../shared/general_config.py')
config.source('../shared/dracula.py')

c.session.default_name = 'general'
