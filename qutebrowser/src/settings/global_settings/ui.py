def window(c):
	c.hide_decoration = True
	c.title_format = 'not used'
	c.transparent = True


def zoom(c):
	c.default = '100%'
	c.mouse_divider = 3000
	c.levels = [
		'25%',
		'33%',
		'50%',
		'67%',
		'75%',
		'90%',
		'100%',
		'110%',
		'125%',
		'150%',
		'175%',
		'200%',
		'250%',
		'300%',
		'400%',
		'500%',
	]


def colors(c):
	c.webpage.darkmode.enabled = False
	c.webpage.darkmode.algorithm = 'lightness-cielab'
	c.webpage.darkmode.contrast = 0
	c.webpage.darkmode.policy.images = 'never'
	c.webpage.darkmode.policy.page = 'always'
	c.webpage.darkmode.threshold.background = 130
	c.webpage.darkmode.threshold.foreground = 120
	c.webpage.preferred_color_scheme = 'dark'


def scrolling(c):
	c.bar = 'overlay'
	c.smooth = True


def statusbar(c):
	c.padding = {'top': 1, 'bottom': 1, 'left': 1, 'right': 1}
	c.position = 'bottom'
	c.show = 'in-mode'
	c.widgets = [
		'url',
		'search_match',
		'scroll',
	]


def setup(c):
	window(c.window)
	zoom(c.zoom)
	colors(c.colors)
	scrolling(c.scrolling)
	statusbar(c.statusbar)
