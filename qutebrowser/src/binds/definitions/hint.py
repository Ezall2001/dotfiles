from lib.binds import Binds


def setup():
	Binds.bind('f', 'hint all normal', 'normal')
	Binds.bind('F', 'hint all tab-fg', 'normal')
	Binds.bind('<ctrl-f>', 'hint all tab-bg', 'normal')
	Binds.bind('<ctrl-shift-f>', 'hint all hover', 'normal')
	Binds.bind('<space>fy', 'hint all yank', 'normal')
	Binds.bind('<space>fd', 'hint all download', 'normal')
