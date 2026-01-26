local c = require('cmp')

--- @type cmp.ConfigSchema
local conf = { enabled = false }

local config = function()
	c.setup.filetype({ 'TelescopePrompt' }, conf)
end

return config
