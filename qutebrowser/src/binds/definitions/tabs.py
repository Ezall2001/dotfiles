from lib.binds import Binds
from lib.userscript import Params, uscrpt


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


def history():
	Binds.bind('<space>h', 'history --tab', 'normal')
	Binds.bind('H', 'back', 'normal')
	Binds.bind('L', 'forward', 'normal')
	Binds.bind('R', 'reload', 'normal')
	Binds.bind('r', 'reload --force', 'normal')


def nav():
	for i in range(1, 10):
		Binds.bind(f'<alt-{i}>', f'tab-focus --no-last {i}', ['normal', 'insert', 'caret'])

	Binds.bind('<alt-0>', 'tab-focus --no-last 10', ['normal', 'insert', 'caret'])

	Binds.bind('[t', 'tab-focus stack-prev', 'normal')
	Binds.bind(']t', 'tab-focus stack-next', 'normal')


def base():
	Binds.bind(
		'b',
		uscrpt(Params(), 'goto_base', 'true'),
		'normal',
	)
	Binds.bind(
		'B',
		uscrpt(Params(), 'goto_base'),
		'normal',
	)


def move():
	letter_num_map = ['!', '@', '#', '$', '%', '^', '&', '*', '(', ')']
	for i in range(1, 10):
		Binds.bind(
			f'<alt-shift-{letter_num_map[i - 1]}>', f'tab-move {i}', ['normal', 'insert', 'caret']
		)

	Binds.bind('<alt-shift-)>', 'tab-move 10', ['normal', 'insert', 'caret'])


def other():
	Binds.bind('x', 'tab-close', 'normal')
	Binds.bind('o', 'cmd-set-text -s :open --tab', 'normal')
	Binds.bind('O', 'cmd-set-text -s :open', 'normal')
	Binds.bind('<ctrl-o>', 'cmd-set-text -s :open --bg', 'normal')
	Binds.bind('<space>u', 'undo', 'normal')


def setup():
	scroll()
	zoom()
	move()
	nav()
	history()
	base()
	other()
