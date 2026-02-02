require('features.plugins.lazy_pm.bootstrap')
local conf = require('features.plugins.lazy_pm.conf')
local derive_specs = require('features.plugins.lazy_pm.derive_specs')
local specs = require('features.plugins.specs')

return {
	init = function()
		local _conf = vim.tbl_deep_extend('force', conf, { spec = derive_specs(specs) })
		require('lazy').setup(_conf)
	end,
}
