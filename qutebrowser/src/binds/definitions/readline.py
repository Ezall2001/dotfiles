from lib.binds import Binds


def setup():
	Binds.bind('<ctrl-b>', 'rl-backward-word', ['prompt', 'command'])
	Binds.bind('<ctrl-w>', 'rl-forward-word', ['prompt', 'command'])
	Binds.bind(
		'<ctrl-shift-b>',
		'rl-backward-kill-word',
		['prompt', 'command'],
	)
	Binds.bind(
		'<ctrl-shift-w>',
		'rl-kill-word',
		['prompt', 'command'],
	)

	Binds.bind(
		'<ctrl-h>',
		'rl-beginning-of-line',
		['prompt', 'command'],
	)
	Binds.bind('<ctrl-l>', 'rl-end-of-line', ['prompt', 'command'])
	Binds.bind(
		'<ctrl-shift-h>',
		'rl-rubout ""',
		['prompt', 'command'],
	)
	Binds.bind(
		'<ctrl-shift-l>',
		'rl-kill-line',
		['prompt', 'command'],
	)
