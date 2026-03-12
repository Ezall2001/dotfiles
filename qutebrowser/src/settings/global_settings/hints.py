def hints(c):
	c.auto_follow = 'unique-match'
	c.auto_follow_timeout = 200
	c.chars = 'aoeuidhtns'
	c.dictionary = '/usr/share/dict/words'
	c.hide_unmatched_rapid_hints = True
	c.leave_on_load = False
	c.min_chars = 1
	c.mode = 'letter'
	c.next_regexes = [
		'\\bnext\\b',
		'\\bmore\\b',
		'\\bnewer\\b',
		'\\b[>→≫]\\b',
		'\\b(>>|»)\\b',
		'\\bcontinue\\b',
	]
	c.prev_regexes = [
		'\\bprev(ious)?\\b',
		'\\bback\\b',
		'\\bolder\\b',
		'\\b[<←≪]\\b',
		'\\b(<<|«)\\b',
	]
	c.selectors = {
		'all': [
			'a',
			'area',
			'textarea',
			'select',
			'input:not([type="hidden"])',
			'button',
			'frame',
			'iframe',
			'img',
			'link',
			'summary',
			'[contenteditable]:not([contenteditable="false"])',
			'[onclick]',
			'[onmousedown]',
			'[role="link"]',
			'[role="option"]',
			'[role="button"]',
			'[role="tab"]',
			'[role="checkbox"]',
			'[role="switch"]',
			'[role="menuitem"]',
			'[role="menuitemcheckbox"]',
			'[role="menuitemradio"]',
			'[role="treeitem"]',
			'[aria-haspopup]',
			'[ng-click]',
			'[ngClick]',
			'[data-ng-click]',
			'[x-ng-click]',
			'[tabindex]:not([tabindex="-1"])',
		],
		'links': ['a[href]', 'area[href]', 'link[href]', '[role="link"][href]'],
		'images': ['img'],
		'media': ['audio', 'img', 'video'],
		'url': ['[src]', '[href]'],
		'inputs': [
			'input[type="text"]',
			'input[type="date"]',
			'input[type="datetime-local"]',
			'input[type="email"]',
			'input[type="month"]',
			'input[type="number"]',
			'input[type="password"]',
			'input[type="search"]',
			'input[type="tel"]',
			'input[type="time"]',
			'input[type="url"]',
			'input[type="week"]',
			'input:not([type])',
			'[contenteditable]:not([contenteditable="false"])',
			'textarea',
		],
	}
	c.padding = {'top': 0, 'bottom': 0, 'left': 3, 'right': 3}
	c.radius = 10
	c.scatter = True
	c.uppercase = False


def setup(c):
	hints(c.hints)
