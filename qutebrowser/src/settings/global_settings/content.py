def content(c):
	c.autoplay = True
	c.blocking.adblock.lists = [
		'https://easylist.to/easylist/easylist.txt',
		'https://easylist.to/easylist/easyprivacy.txt',
	]
	c.blocking.enabled = True
	c.blocking.hosts.block_subdomains = True
	c.blocking.hosts.lists = ['https://raw.githubusercontent.com/StevenBlack/hosts/master/hosts']
	c.blocking.method = 'both'
	c.blocking.whitelist = []
	c.cache.size = 2147483647
	c.canvas_reading = True
	c.cookies.accept = 'all'
	c.cookies.store = True
	c.default_encoding = 'iso-8859-1'
	c.desktop_capture = 'ask'
	c.dns_prefetch = True
	c.fullscreen.overlay_timeout = 0
	c.fullscreen.window = False
	c.geolocation = 'ask'
	c.headers.accept_language = 'en-US,en;q=0.9'
	c.headers.custom = {}
	c.headers.do_not_track = True
	c.headers.referer = 'same-domain'
	c.headers.user_agent = 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version_short} Safari/{webkit_version}'
	c.hyperlink_auditing = False
	c.images = True
	c.javascript.alert = True
	c.javascript.can_open_tabs_automatically = False
	c.javascript.clipboard = 'ask'
	c.javascript.enabled = True
	c.javascript.legacy_touch_events = 'never'
	c.javascript.log = {
		'unknown': 'debug',
		'info': 'info',
		'warning': 'warning',
		'error': 'error',
	}
	c.javascript.log_message.excludes = {
		'userscript:_qute_stylesheet': [
			'*Refused to apply inline style because it violates the following Content Security Policy directive: *'
		]
	}
	c.javascript.log_message.levels = {
		'qute:*': ['error'],
		'userscript:GM-*': [],
		'userscript:*': ['error'],
	}
	c.javascript.modal_dialog = False
	c.javascript.prompt = True
	c.local_content_can_access_file_urls = True
	c.local_content_can_access_remote_urls = False
	c.local_storage = True
	c.media.audio_capture = 'ask'
	c.media.audio_video_capture = 'ask'
	c.media.video_capture = 'ask'
	c.mouse_lock = 'ask'
	c.notifications.enabled = 'ask'
	c.mute = False
	c.notifications.presenter = 'libnotify'
	c.notifications.show_origin = False
	c.pdfjs = True
	c.persistent_storage = 'ask'
	c.plugins = False
	c.prefers_reduced_motion = False
	c.print_element_backgrounds = True
	c.private_browsing = False
	c.proxy = 'system'
	c.register_protocol_handler = 'ask'
	c.site_specific_quirks.enabled = True
	c.site_specific_quirks.skip = []
	c.tls.certificate_errors = 'ask'
	c.unknown_url_scheme_policy = 'allow-from-user-interaction'
	c.user_stylesheets = []
	c.webgl = True
	c.webrtc_ip_handling_policy = 'all-interfaces'
	c.xss_auditing = False


def setup(c):
	content(c.content)
