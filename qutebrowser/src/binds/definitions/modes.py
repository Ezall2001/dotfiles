from lib.binds import Binds


def insert():
	Binds.bind('<space>i', 'hint --first inputs normal', 'normal')
	Binds.bind('i', 'mode-enter insert', 'normal')


def passthrough():
	Binds.bind('<space>g', 'mode-enter passthrough', 'normal')
	Binds.bind('<ctrl-escape>', 'mode-leave', 'passthrough')


def prompt():
	Binds.bind('y', 'prompt-accept yes', 'yesno')
	Binds.bind('n', 'prompt-accept no', 'yesno')
	Binds.bind('Y', 'prompt-accept --save yes', 'yesno')
	Binds.bind('N', 'prompt-accept --save no', 'yesno')
	Binds.bind('<space>y', 'prompt-yank', 'yesno')

	Binds.bind('<return>', 'prompt-accept', 'prompt')
	Binds.bind('<ctrl-y>', 'prompt-yank', 'prompt')
	Binds.bind('<ctrl-f>', 'prompt-fileselect-external', 'prompt')
	Binds.bind('<ctrl-x>', 'prompt-open-download', 'prompt')
	Binds.bind('<ctrl-w>', 'prompt-open-download --pdfjs', 'prompt')
	Binds.bind('<ctrl-n>', 'prompt-item-focus next', 'prompt')
	Binds.bind('<ctrl-p>', 'prompt-item-focus prev', 'prompt')


def command():
	Binds.bind(':', 'cmd-set-text :', 'normal')
	Binds.bind('.', 'cmd-repeat-last', 'normal')

	Binds.bind('<return>', 'command-accept', 'command')
	Binds.bind('<ctrl-y>', 'completion-item-yank', 'command')
	Binds.bind('<ctrl-x>', 'completion-item-del', 'command')

	Binds.bind('<ctrl-u>', 'command-history-prev', 'command')
	Binds.bind('<ctrl-d>', 'command-history-next', 'command')
	Binds.bind('<ctrl-p>', 'completion-item-focus prev', 'command')
	Binds.bind('<ctrl-n>', 'completion-item-focus next', 'command')
	Binds.bind(
		'<ctrl-[>',
		'completion-item-focus prev-category',
		'command',
	)
	Binds.bind(
		'<ctrl-]>',
		'completion-item-focus next-category',
		'command',
	)


def normal():
	Binds.bind('<escape>', 'search', 'normal')


def other():
	Binds.bind('<escape>', 'mode-leave', ['insert', 'hint', 'register', 'prompt', 'yesno', 'command'])
	Binds.bind('<ctrl-escape>', 'fake-key <escape>', ['insert', 'normal'])


def setup():
	command()
	normal()
	insert()
	passthrough()
	prompt()
	other()
