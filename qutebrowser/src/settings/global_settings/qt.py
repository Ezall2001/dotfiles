def qt(c):
	c.args = []
	c.chromium.experimental_web_platform_features = 'always'
	c.chromium.low_end_device_mode = 'auto'
	c.chromium.process_model = 'process-per-site-instance'
	c.chromium.sandboxing = 'enable-all'
	c.environ = {}
	c.force_platform = None
	c.force_platformtheme = None
	c.force_software_rendering = 'none'
	c.highdpi = False
	c.workarounds.disable_accelerated_2d_canvas = 'auto'
	c.workarounds.disable_hangouts_extension = False
	c.workarounds.locale = False
	c.workarounds.remove_service_workers = False


def setup(c):
	qt(c.qt)
