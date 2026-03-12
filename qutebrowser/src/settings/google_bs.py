from qutebrowser.config.configfiles import ConfigAPI


def setup(config: ConfigAPI):
	config.set(
		'content.headers.user_agent',
		'Mozilla/5.0 ({os_info}; rv:130.0) Gecko/20100101 Firefox/130',
		'https://accounts.google.com/*',
	)
