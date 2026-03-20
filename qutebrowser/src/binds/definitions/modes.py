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


def caret():
	Binds.bind('v', 'mode-enter caret', 'normal')
	Binds.bind('V', 'mode-enter caret;;selection-toggle --line', 'normal')
	Binds.bind('v', 'selection-toggle', 'caret')
	Binds.bind('V', 'selection-toggle --line', 'caret')

	Binds.bind('h', 'move-to-prev-char', 'caret')
	Binds.bind('l', 'move-to-next-char', 'caret')
	Binds.bind('k', 'move-to-prev-line', 'caret')
	Binds.bind('j', 'move-to-next-line', 'caret')
	Binds.bind('H', 'move-to-start-of-line', 'caret')
	Binds.bind('L', 'move-to-end-of-line', 'caret')
	Binds.bind('K', 'move-to-start-of-document', 'caret')
	Binds.bind('J', 'move-to-end-of-document', 'caret')
	Binds.bind('b', 'move-to-prev-word', 'caret')
	Binds.bind('w', 'move-to-next-word', 'caret')
	Binds.bind('e', 'move-to-end-of-word', 'caret')
	Binds.bind('[', 'move-to-start-of-prev-block', 'caret')
	Binds.bind(']', 'move-to-start-of-next-block', 'caret')
	Binds.bind('{', 'move-to-end-of-prev-block', 'caret')
	Binds.bind('}', 'move-to-end-of-next-block', 'caret')

	Binds.bind('<ctrl-h>', 'scroll left', 'caret')
	Binds.bind('<ctrl-l>', 'scroll right', 'caret')
	Binds.bind('<ctrl-k>', 'scroll up', 'caret')
	Binds.bind('<ctrl-j>', 'scroll down', 'caret')

	Binds.bind('y', 'yank selection', ['normal', 'caret'])
	Binds.bind('o', 'selection-reverse', 'caret')


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
	Binds.bind(
		'<escape>', 'mode-leave', ['insert', 'hint', 'register', 'prompt', 'yesno', 'command', 'caret']
	)
	Binds.bind('<ctrl-escape>', 'fake-key <escape>', ['insert', 'normal'])


def setup():
	command()
	caret()
	normal()
	insert()
	passthrough()
	prompt()
	other()
