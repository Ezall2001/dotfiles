local insure_installed = require('features.mason.ensure_installed')
local p = require('features.plugins')

local init = function()
	p.on_plugin_register('mason', insure_installed)
end

return {
	init = init,
}
