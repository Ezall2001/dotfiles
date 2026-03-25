from lib.binds import Binds
from lib.userscript import Params, uscrpt


def search():
	Binds.bind('/', 'cmd-set-text /', 'normal')
	Binds.bind('?', 'cmd-set-text ?', 'normal')
	Binds.bind('n', 'search-next', 'normal')
	Binds.bind('N', 'search-prev', 'normal')


def dev():
	Binds.bind('<space>/s', 'config-source;;message-info reloaded', 'normal')
	Binds.bind('<space>/h', 'help --tab', 'normal')


def messages():
	Binds.bind('<space>nx', 'clear-messages', 'normal')
	Binds.bind('<space>nt', 'messages --bg', 'normal')


def devtools():
	Binds.bind('<space>dt', 'devtools right', 'normal')
	Binds.bind('<space>df', 'devtools-focus', 'normal')


def darktheme():
	Binds.bind(
		'<space>t',
		uscrpt(Params('message'), 'theme', 'toggle'),
		'normal',
	)


def setup():
	search()
	dev()
	messages()
	devtools()
	darktheme()
