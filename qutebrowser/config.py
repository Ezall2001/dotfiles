import sys
from pathlib import Path

src = Path(__file__).parent.resolve() / 'src'
sys.path.append(str(src))

import binds  # noqa: E402
import settings  # noqa: E402

settings.setup(config, c)
binds.setup(config, c)
config.load_autoconfig(True)
