from qutebrowser.config.configfiles import ConfigAPI


class Binds:
	binds = []

	@staticmethod
	def bind(key, command, modes):
		if type(modes) is not list:
			modes = [modes]

		for mode in modes:
			Binds.binds.append((key, command, mode))

	@staticmethod
	def apply(config: ConfigAPI):
		for bind in Binds.binds:
			config.bind(*bind)
