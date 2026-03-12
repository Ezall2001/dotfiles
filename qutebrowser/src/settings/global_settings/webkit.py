def setup(c):
	c.content.cache.appcache = True
	c.content.cache.maximum_pages = 10
	c.content.frame_flattening = False
	c.content.javascript.can_close_tabs = False
	c.content.proxy_dns_requests = True
	c.hints.find_implementation = 'javascript'
	c.zoom.text_only = False
