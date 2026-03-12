def other(c):
	c.new_instance_open_target = 'tab'
	c.new_instance_open_target_window = 'last-focused'


def tabs(c):
	c.background = True
	c.close_mouse_button = 'middle'
	c.close_mouse_button_on_bar = 'new-tab'
	c.favicons.scale = 1.0
	c.favicons.show = 'always'
	c.focus_stack_size = 30
	c.indicator.padding = {'top': 1, 'bottom': 1, 'left': 0, 'right': 4}
	c.indicator.width = 0
	c.last_close = 'startpage'
	c.max_width = 300
	c.min_width = 100
	c.mode_on_change = 'restore'
	c.mousewheel_switching = True
	c.new_position.related = 'next'
	c.new_position.stacking = True
	c.new_position.unrelated = 'last'
	c.padding = {'top': 0, 'bottom': 0, 'left': 5, 'right': 5}
	c.pinned.frozen = True
	c.pinned.shrink = True
	c.position = 'top'
	c.select_on_remove = 'next'
	c.show = 'multiple'
	c.show_switching_delay = 1000
	c.tabs_are_windows = False
	c.title.alignment = 'left'
	c.title.elide = 'right'
	c.title.format = '{perc}{audio}{private}{index}  {current_title}'
	c.title.format_pinned = '{index}'
	c.tooltips = True
	c.undo_stack_size = 100
	c.width = '15%'
	c.wrap = True


def setup(c):
	tabs(c.tabs)
	other(c)
