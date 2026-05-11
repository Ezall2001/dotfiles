local r = require('utils.require_all_in_dir')

local M = {}

M.init = function()
	local r_path = vim.fs.joinpath('configs', 'ft_configs', 'definitions')

	r(r_path, function(mod)
		mod.init()
	end)
end

return M
