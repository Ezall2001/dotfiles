from lib.binds import Binds


# TODO: split
def setup():
	Binds.bind('y', 'yank selection', 'normal')
	Binds.bind('<space>y', 'yank url', 'normal')
