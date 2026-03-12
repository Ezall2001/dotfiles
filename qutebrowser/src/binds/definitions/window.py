from lib.binds import Binds


def zoom():
	Binds.bind('<=>', 'zoom-in', 'normal')
	Binds.bind('<->', 'zoom-out', 'normal')
	Binds.bind('<+>', 'zoom 100', 'normal')


def scroll():
	Binds.bind('h', 'scroll left', 'normal')
	Binds.bind('l', 'scroll right', 'normal')
	Binds.bind('k', 'scroll up', 'normal')
	Binds.bind('j', 'scroll down', 'normal')
	Binds.bind('K', 'scroll top', 'normal')
	Binds.bind('J', 'scroll bottom', 'normal')
	Binds.bind('u', 'scroll-page 0 -0.5', 'normal')
	Binds.bind('d', 'scroll-page 0 0.5', 'normal')


def setup():
	zoom()
	scroll()
