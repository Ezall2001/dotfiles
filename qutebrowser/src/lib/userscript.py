from pathlib import Path
from typing import Literal

USERSCRIPT_PATH = Path('~/.config/scripts/qtb/qtb_userscript').expanduser()


class Params:
	def __init__(
		self,
		output: Literal['message', 'tab', None] = None,
		notification: bool = False,
		detach: bool = False,
	):
		self.output = output
		self.notification = notification
		self.detach = detach

	def __str__(self):
		params = []

		if self.output == 'tab':
			params.append('--output')
		elif self.output == 'message':
			params.append('--output-messages')

		if self.notification:
			params.append('--verbose')

		if self.detach:
			params.append('--detach')

		return ' '.join(params)


def uscrpt(params: Params, *args):
	args_str = ' '.join(args)
	return f'spawn -u {params} {USERSCRIPT_PATH} {args_str}'
