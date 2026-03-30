from qutebrowser.config.config import ConfigContainer


def search(c):
	c.ignore_case = 'smart'
	c.incremental = True
	c.wrap = True
	c.wrap_messages = True


def url(c):
	c.auto_search = 'naive'
	c.default_page = 'https://search.brave.com'
	c.incdec_segments = ['path', 'query']
	c.open_base_url = True
	c.searchengines = {
		'DEFAULT': 'https://search.brave.com/search?q={}',
		'yt': 'https://www.youtube.com/results?search_query={}',
		'gt': 'https://github.com/search?q={}&type=repositories',
		'gg': 'https://www.google.com/search?q={}',
	}
	c.start_pages = ['https://search.brave.com']
	c.yank_ignored_parameters = [
		'ref',
		'utm_source',
		'utm_medium',
		'utm_campaign',
		'utm_term',
		'utm_content',
		'utm_name',
	]


def completion(c):
	c.cmd_history_max_items = 100
	c.delay = 200
	c.favorite_paths = []
	c.height = '50%'
	c.min_chars = 1
	c.open_categories = [
		'quickmarks',
		'history',
		'filesystem',
		'searchengines',
	]
	c.quick = True
	c.scrollbar.padding = 0
	c.scrollbar.width = 7
	c.show = 'always'
	c.shrink = True
	c.timestamp_format = '%Y-%m-%d %H:%M'
	c.use_best_match = False
	c.web_history.exclude = []
	c.web_history.max_items = -1


def downloads(c):
	c.location.directory = '~/Downloads/qutebrowser'
	c.location.prompt = True
	c.location.remember = True
	c.location.suggestion = 'both'
	c.open_dispatcher = 'xdg-open'
	c.position = 'top'
	c.prevent_mixed_content = True
	c.remove_finished = 5000


def editor(c):
	# TODO: set this with the vi script
	c.command = ['ghostty', '-e', 'nvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
	c.encoding = 'utf-8'
	c.remove_file = False


def fileselect(c):
	c.handler = 'external'
	c.folder.command = ['hyp_file_select', '--dir']
	c.multiple_files.command = ['hyp_file_select', '--multi']
	c.single_file.command = ['hyp_file_select']


def other(c):
	c.logging.level.console = 'info'
	c.logging.level.ram = 'debug'
	c.messages.timeout = 3000
	c.prompt.filebrowser = True
	c.prompt.radius = 10
	c.history_gap_interval = 30
	c.spellcheck.languages = []
	c.aliases = {}
	c.auto_save.interval = 5000
	c.auto_save.session = True
	c.session.default_name = 'tmp'
	c.session.lazy_restore = True
	c.backend = 'webengine'
	c.changelog_after_upgrade = 'minor'
	c.confirm_quit = ['downloads']


def setup(c: ConfigContainer):
	completion(c.completion)
	search(c.search)
	url(c.url)
	downloads(c.downloads)
	editor(c.editor)
	fileselect(c.fileselect)
	other(c)
