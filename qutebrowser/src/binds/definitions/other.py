from lib.binds import Binds
from lib.userscript import Params, uscrpt


def marks():
	Binds.bind('M', 'mode-enter set_mark', 'normal')
	Binds.bind('m', 'mode-enter jump_mark', 'normal')


def download():
	Binds.bind('<space>dp', 'download', 'normal')
	Binds.bind('<space>do', 'download-open', 'normal')
	Binds.bind('<space>dc', 'download-cancel', 'normal')
	Binds.bind('<space>dd', 'download-delete', 'normal')
	Binds.bind('<space>dr', 'download-retry', 'normal')


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
	Binds.bind('<space>vo', 'devtools right', 'normal')
	Binds.bind('<space>vf', 'devtools-focus', 'normal')


def darktheme():
	Binds.bind(
		'<space>t',
		uscrpt(Params('message'), 'theme', 'toggle'),
		'normal',
	)


def setup():
	marks()
	search()
	dev()
	messages()
	devtools()
	darktheme()
	download()
