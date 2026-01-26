local get_normal_cas = require('features.lsp.global_config.fix.auto_code_actions.get_ca.get_normal_ca')

local get_ts_ca = function(client, kind)
	local trials = 0

	while trials < 10 do
		local ca = get_normal_cas(client, kind)
		if ca ~= nil then
			return ca
		end

		vim.wait(100)
		trials = trials + 1
	end

	return nil
end

return get_ts_ca
