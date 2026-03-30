from lib.binds import Binds
from lib.userscript import Params, uscrpt


def macro():
	Binds.bind('q', 'macro-record', 'normal')
	Binds.bind('Q', 'macro-run', 'normal')


def bookmarks():
	Binds.bind('<space>ba', 'cmd-set-text -s :bookmark-add {url}', 'normal')
	Binds.bind('<space>bd', 'cmd-set-text -s :bookmark-del', 'normal')
	Binds.bind('<space>bl', 'bookmark-list --tab --jump', 'normal')
	Binds.bind('<space>bx', 'hint --rapid links run bookmark-del {hint-url}', 'normal')


def quickmarks():
	Binds.bind('<space>qa', 'cmd-set-text -s :quickmark-add {url}', 'normal')
	Binds.bind('<space>qd', 'cmd-set-text -s :quickmark-del', 'normal')
	Binds.bind('<space>ql', 'bookmark-list --tab', 'normal')


def hints():
	Binds.bind('f', 'hint all normal', 'normal')
	Binds.bind('F', 'hint all tab-fg', 'normal')
	Binds.bind('<ctrl-f>', 'hint all tab-bg', 'normal')
	Binds.bind('<ctrl-shift-f>', 'hint all hover', 'normal')
	Binds.bind('<space>fy', 'hint all yank', 'normal')
	Binds.bind('<space>fd', 'hint all download', 'normal')
	Binds.bind('<space>fr', 'hint all --rapid tab-bg', 'normal')


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
	macro()
	bookmarks()
	quickmarks()
	marks()
	search()
	hints()
	dev()
	messages()
	devtools()
	darktheme()
	download()
