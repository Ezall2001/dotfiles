from lib.binds import Binds
from lib.userscript import Params, uscrpt


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
		uscrpt(Params(), 'nav', 'goto_base', 'true'),
		'normal',
	)
	Binds.bind(
		'B',
		uscrpt(Params(), 'nav', 'goto_base'),
		'normal',
	)


def move():
	for i in range(1, 10):
		Binds.bind(f'<alt-ctrl-{i}>', f'tab-move {i}', ['normal', 'insert', 'caret'])

	Binds.bind('<alt-ctrl-0>', 'tab-move 10', ['normal', 'insert', 'caret'])


def other():
	Binds.bind('x', 'tab-close', 'normal')
	Binds.bind('o', 'cmd-set-text -s :open --tab', 'normal')
	Binds.bind('O', 'cmd-set-text -s :open', 'normal')
	Binds.bind('<ctrl-o>', 'cmd-set-text -s :open --bg', 'normal')
	Binds.bind('<space>u', 'undo', 'normal')


def setup():
	move()
	nav()
	history()
	base()
	other()
