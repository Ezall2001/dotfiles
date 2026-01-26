local c = require('cmp')

local extra_conf = {
	experimental = { ghost_text = false },
}

local config = function(global_conf)
	local conf = vim.tbl_deep_extend('force', global_conf, extra_conf)
	c.setup.filetype({ 'typst' }, conf)
end

return config
