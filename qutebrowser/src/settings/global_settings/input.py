def input(c):
	c.escape_quits_reporter = True
	c.forward_unbound_keys = 'auto'
	c.insert_mode.auto_enter = True
	c.insert_mode.auto_leave = True
	c.insert_mode.auto_load = False
	c.insert_mode.leave_on_load = True
	c.insert_mode.plugins = False
	c.links_included_in_focus_chain = True
	c.match_counts = True
	c.media_keys = True
	c.mode_override = None
	c.mouse.back_forward_buttons = True
	c.mouse.rocker_gestures = False
	c.partial_timeout = 500
	c.spatial_navigation = False


def keyhint(c):
	c.blacklist = []
	c.delay = 10000
	c.radius = 10


def setup(c):
	input(c.input)
	keyhint(c.keyhint)
