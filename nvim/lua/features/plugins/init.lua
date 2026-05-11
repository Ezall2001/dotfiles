return {
	init = function()
		require('features.plugins.lazy_pm').init()
	end,
	is_plugin_registred = require('features.plugins.events.registry').is_registred,
	on_plugin_register = require('features.plugins.events.event_handler'),
	register_plugin = require('features.plugins.events.register_event'),
}
