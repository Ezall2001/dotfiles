local r = require('utils.require_all_in_dir')

local override = function(global_config)
	local cb = function(mod)
		mod(global_config)
	end

	local r_path = vim.fs.joinpath('features', 'plugins', 'configs', 'lsp', 'cmp', 'overrides')

	r(r_path, cb)
end

return override
